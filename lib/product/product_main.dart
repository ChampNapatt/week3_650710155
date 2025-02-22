import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import 'product_page/product_edit.dart';
import 'product_page/product_create.dart';
import 'product_model/product_model.dart';

class ProductMainPage extends StatefulWidget {
  const ProductMainPage({super.key});

  @override
  State<ProductMainPage> createState() => _ProductMainPageState();
}

class _ProductMainPageState extends State<ProductMainPage> {
  bool isLoaded = true;
  List<Product> product = [];
  Future<void> fetchData() async {
    try {
      var response = await http.get(Uri.parse('http://10.0.2.2:8001/products'));
      if (response.statusCode == 200) {
        List<dynamic> jsonList = jsonDecode(response.body);
        //print(jsonList);
        setState(() {
          product = jsonList.map((item) => Product.fromJson(item)).toList();
          isLoaded = true;
        });
      } else {
        throw Exception("Failed to load products");
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        backgroundColor: const Color.fromARGB(255, 155, 253, 248),
      ),
      body: isLoaded
          ? ListView.separated(
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
              itemCount: product.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: Text('${product[index].id}'),
                  title: Text('${product[index].name}'),
                  subtitle: Text('${product[index].description}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '${product[index].price}',
                        style: const TextStyle(
                            color: Color.fromARGB(255, 30, 26, 248),
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      const Icon(
                        Icons.edit,
                        color: Colors.grey,
                        size: 20,
                      ),
                    ],
                  ),
                  onTap: () async {
                    bool? isUpdated = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductEditPage(
                            productId: product[index].id.toString()),
                      ),
                    );
                    if (isUpdated == true) {
                      fetchData(); // โหลดข้อมูลใหม่ถ้ามีการแก้ไขหรือลบ
                    }
                  },
                );
              })
          : const Center(child: Text('loading...')),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          bool? isUpdated = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ProductFormPage()),
          );

          if (isUpdated == true) {
            fetchData(); // โหลดข้อมูลใหม่เมื่อกลับมาจากหน้าเพิ่มสินค้า
          }
        },
        backgroundColor: const Color.fromARGB(255, 250, 111, 111),
        child: const Icon(Icons.add),
      ),
    );
  }
}