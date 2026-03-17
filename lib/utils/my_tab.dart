import 'package:flutter/material.dart';

class MyTab extends StatelessWidget {
  final IconData icon;
  final String tabName;

  const MyTab({
    super.key, 
    required this.icon, 
    required this.tabName,
  });

  @override
  Widget build(BuildContext context) {
    return Tab(
      height: 80,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            // borde circular
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Icon(
                  icon, 
                  color: Colors.grey[600],
                  size: 30, // Default size for tabs
                ),
              ),
              const SizedBox(height: 4),
              Text(
                tabName, 
                style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}