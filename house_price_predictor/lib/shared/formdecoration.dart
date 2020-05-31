import 'package:flutter/material.dart';


var formdecoration = InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide: BorderSide(
                                          color: Colors.blue,
                                          width: 2,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.blue,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      labelStyle: TextStyle(
                                        color: Colors.blue,
                                      ),
                                      helperText: '*required',
                                      helperStyle:
                                          TextStyle(color: Colors.red));