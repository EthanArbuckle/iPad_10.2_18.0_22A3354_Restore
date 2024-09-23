@implementation WAProtobufMessageSubmitter

- (id)instantiateAWDProtobufAndPopulateValues:(id)a3
{
  id v4;
  NSString *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  BOOL v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  NSString *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  unsigned int v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  int v41;
  int v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  unsigned __int8 v47;
  id v48;
  NSObject *v49;
  uint64_t v50;
  uint64_t v51;
  int v52;
  BOOL v53;
  id v54;
  NSObject *v55;
  id v56;
  void *v57;
  void *v58;
  NSObject *obj;
  uint64_t v61;
  id v62;
  void *context;
  uint64_t v64;
  void *v65;
  _BYTE v66[128];
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _BYTE buf[12];
  __int16 v72;
  int v73;
  __int16 v74;
  id v75;
  __int16 v76;
  void *v77;
  __int16 v78;
  id v79;

  v4 = a3;
  v65 = v4;
  v5 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "originalClassName"));
  v6 = objc_alloc_init(NSClassFromString(v5));

  if (v4)
  {
    if (v6)
    {
      v69 = 0u;
      v70 = 0u;
      v67 = 0u;
      v68 = 0u;
      obj = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mutableFields"));
      v7 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v67, v66, 16);
      if (v7)
      {
        v8 = 0;
        v61 = *(_QWORD *)v68;
        while (1)
        {
          v9 = 0;
          v62 = v7;
          do
          {
            if (*(_QWORD *)v68 != v61)
              objc_enumerationMutation(obj);
            v64 = v9;
            v10 = *(_QWORD *)(*((_QWORD *)&v67 + 1) + 8 * v9);
            context = objc_autoreleasePoolPush();
            v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "mutableFields"));
            v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", v10));

            v13 = 0;
            while (objc_msgSend(v12, "isRepeatable"))
            {
              v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "repeatableValues"));
              v15 = v13 < (unint64_t)objc_msgSend(v14, "count");

              if (!v15)
                goto LABEL_66;
LABEL_13:
              v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "key"));
              v17 = (void *)objc_claimAutoreleasedReturnValue(-[WAProtobufMessageSubmitter _generateSetterInvocationFromInstance:andFieldKey:isRepeatable:](self, "_generateSetterInvocationFromInstance:andFieldKey:isRepeatable:", v6, v16, objc_msgSend(v12, "isRepeatable")));

              v8 = v17;
              if ((objc_opt_respondsToSelector(v6, objc_msgSend(v17, "selector")) & 1) == 0)
              {
                v18 = WALogCategoryDefaultHandle();
                v19 = objc_claimAutoreleasedReturnValue(v18);
                if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
                {
                  v20 = NSStringFromSelector((SEL)objc_msgSend(v8, "selector"));
                  v21 = (id)objc_claimAutoreleasedReturnValue(v20);
                  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "key"));
                  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "key"));
                  *(_DWORD *)buf = 136447234;
                  *(_QWORD *)&buf[4] = "-[WAProtobufMessageSubmitter instantiateAWDProtobufAndPopulateValues:]";
                  v72 = 1024;
                  v73 = 31;
                  v74 = 2112;
                  v75 = v21;
                  v76 = 2112;
                  v77 = v22;
                  v78 = 2112;
                  v79 = v23;
                  _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%{public}s::%d:Instantiated metric class doesn't respond to expected selector for setting! Selector: %@ on a class with key: %@ for field with key: %@", buf, 0x30u);

                }
              }
              switch((unint64_t)objc_msgSend(v12, "type"))
              {
                case 1uLL:
                  *(_QWORD *)buf = 0;
                  if (objc_msgSend(v12, "isRepeatable"))
                  {
                    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "repeatableValues"));
                    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "objectAtIndexedSubscript:", v13));
                    objc_msgSend(v36, "doubleValue");
                    v38 = v37;

                  }
                  else
                  {
                    objc_msgSend(v12, "doubleValue");
                    v38 = v51;
                  }
                  *(_QWORD *)buf = v38;
                  objc_msgSend(v8, "setArgument:atIndex:", buf, 2);
                  break;
                case 2uLL:
                  *(_DWORD *)buf = 0;
                  if (objc_msgSend(v12, "isRepeatable"))
                  {
                    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "repeatableValues"));
                    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "objectAtIndexedSubscript:", v13));
                    objc_msgSend(v40, "floatValue");
                    v42 = v41;

                  }
                  else
                  {
                    objc_msgSend(v12, "floatValue");
                    v42 = v52;
                  }
                  *(_DWORD *)buf = v42;
                  objc_msgSend(v8, "setArgument:atIndex:", buf, 2);
                  break;
                case 3uLL:
                  *(_DWORD *)buf = 0;
                  if (objc_msgSend(v12, "isRepeatable"))
                  {
                    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "repeatableValues"));
                    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectAtIndexedSubscript:", v13));
                    v27 = objc_msgSend(v31, "intValue");

                  }
                  else
                  {
                    v27 = objc_msgSend(v12, "int32Value");
                  }
                  goto LABEL_42;
                case 4uLL:
                  *(_QWORD *)buf = 0;
                  if (objc_msgSend(v12, "isRepeatable"))
                  {
                    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "repeatableValues"));
                    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "objectAtIndexedSubscript:", v13));
                    v34 = objc_msgSend(v33, "longLongValue");

                  }
                  else
                  {
                    v34 = objc_msgSend(v12, "int64Value");
                  }
                  goto LABEL_47;
                case 5uLL:
                  *(_DWORD *)buf = 0;
                  if (objc_msgSend(v12, "isRepeatable"))
                  {
                    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "repeatableValues"));
                    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectAtIndexedSubscript:", v13));
                    v27 = objc_msgSend(v26, "unsignedIntValue");

                  }
                  else
                  {
                    v27 = objc_msgSend(v12, "uint32Value");
                  }
LABEL_42:
                  *(_DWORD *)buf = v27;
                  objc_msgSend(v8, "setArgument:atIndex:", buf, 2);
                  break;
                case 6uLL:
                  *(_QWORD *)buf = 0;
                  if (objc_msgSend(v12, "isRepeatable"))
                  {
                    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "repeatableValues"));
                    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "objectAtIndexedSubscript:", v13));
                    v34 = objc_msgSend(v44, "unsignedLongLongValue");

                  }
                  else
                  {
                    v34 = objc_msgSend(v12, "uint64Value");
                  }
LABEL_47:
                  *(_QWORD *)buf = v34;
                  objc_msgSend(v8, "setArgument:atIndex:", buf, 2);
                  break;
                case 7uLL:
                  buf[0] = 0;
                  if (objc_msgSend(v12, "isRepeatable"))
                  {
                    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "repeatableValues"));
                    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "objectAtIndexedSubscript:", v13));
                    v47 = objc_msgSend(v46, "BOOLValue");

                  }
                  else
                  {
                    v47 = objc_msgSend(v12, "BOOLValue");
                  }
                  buf[0] = v47;
                  objc_msgSend(v8, "setArgument:atIndex:", buf, 2);
                  break;
                case 8uLL:
                case 9uLL:
                  if (objc_msgSend(v12, "isRepeatable"))
                  {
                    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "repeatableValues"));
                    *(_QWORD *)buf = objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectAtIndexedSubscript:", v13));

                  }
                  else
                  {
                    if (objc_msgSend(v12, "type") == (id)9)
                      v50 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "bytesValue"));
                    else
                      v50 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stringValue"));
                    *(_QWORD *)buf = v50;
                  }
                  objc_msgSend(v8, "setArgument:atIndex:", buf, 2);
                  objc_msgSend(v8, "retainArguments");

                  break;
                case 0xAuLL:
                  if (objc_msgSend(v12, "isRepeatable"))
                  {
                    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "repeatableValues"));
                    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectAtIndexedSubscript:", v13));
                    *(_QWORD *)buf = objc_claimAutoreleasedReturnValue(-[WAProtobufMessageSubmitter instantiateAWDProtobufAndPopulateValues:](self, "instantiateAWDProtobufAndPopulateValues:", v29));

                  }
                  else
                  {
                    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "subMessageValue"));
                    *(_QWORD *)buf = objc_claimAutoreleasedReturnValue(-[WAProtobufMessageSubmitter instantiateAWDProtobufAndPopulateValues:](self, "instantiateAWDProtobufAndPopulateValues:", v28));
                  }

                  objc_msgSend(v8, "setArgument:atIndex:", buf, 2);
                  objc_msgSend(v8, "retainArguments");

                  break;
                default:
                  v48 = WALogCategoryDefaultHandle();
                  v49 = objc_claimAutoreleasedReturnValue(v48);
                  if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 136446466;
                    *(_QWORD *)&buf[4] = "-[WAProtobufMessageSubmitter instantiateAWDProtobufAndPopulateValues:]";
                    v72 = 1024;
                    v73 = 95;
                    _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_ERROR, "%{public}s::%d:PARSER: unexpected type", buf, 0x12u);
                  }

                  break;
              }
              *(_QWORD *)buf = 0;
              objc_msgSend(v8, "getArgument:atIndex:", buf, 2);
              v53 = objc_msgSend(v12, "type") == (id)10
                 || objc_msgSend(v12, "type") == (id)9
                 || objc_msgSend(v12, "type") == (id)8;
              if (*(_QWORD *)buf || !v53)
                objc_msgSend(v8, "invoke");
              ++v13;
            }
            if (!v13)
              goto LABEL_13;
LABEL_66:

            objc_autoreleasePoolPop(context);
            v9 = v64 + 1;
          }
          while ((id)(v64 + 1) != v62);
          v7 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v67, v66, 16);
          if (!v7)
            goto LABEL_74;
        }
      }
    }
    else
    {
      v56 = WALogCategoryDefaultHandle();
      obj = objc_claimAutoreleasedReturnValue(v56);
      if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR))
      {
        v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "key"));
        v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "originalClassName"));
        *(_DWORD *)buf = 136447234;
        *(_QWORD *)&buf[4] = "-[WAProtobufMessageSubmitter instantiateAWDProtobufAndPopulateValues:]";
        v72 = 1024;
        v73 = 21;
        v74 = 2112;
        v75 = v57;
        v76 = 2112;
        v77 = v58;
        v78 = 2112;
        v79 = v4;
        _os_log_impl((void *)&_mh_execute_header, obj, OS_LOG_TYPE_ERROR, "%{public}s::%d:PARSER: Didn't get an instantiated instance of AWD implementation in order to populate filed with key: %@ (%@). Bailing to avoid a crash. *** This is likely due to an out of date WirelessDiagnostics framework on the build (WiFiAnalytics model references classes contained in a newer version of WirelessDiagnostics framework). %@", buf, 0x30u);

      }
    }
  }
  else
  {
    v54 = WALogCategoryDefaultHandle();
    v55 = objc_claimAutoreleasedReturnValue(v54);
    obj = v55;
    if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      *(_QWORD *)&buf[4] = "-[WAProtobufMessageSubmitter instantiateAWDProtobufAndPopulateValues:]";
      v72 = 1024;
      v73 = 20;
      _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_ERROR, "%{public}s::%d:PARSER: Told to submit a NULL MESSAGE", buf, 0x12u);
    }
  }
  v8 = 0;
LABEL_74:

  return v6;
}

- (id)_generateSetterInvocationFromInstance:(id)a3 andFieldKey:(id)a4 isRepeatable:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  id v10;
  unint64_t v11;
  void *v12;
  void **v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  size_t v17;
  _BYTE *v18;
  void **v19;
  const char *v20;
  SEL v21;
  id v22;
  void *v23;
  uint64_t v24;
  std::string *v25;
  size_t v26;
  _BYTE *v27;
  void **v28;
  const char *v29;
  id v30;
  void *v31;
  id v32;
  id v34;
  NSObject *v35;
  std::string *v36;
  void **v37;
  void *v38[2];
  uint64_t v39;
  void *__dst[2];
  unint64_t v41;
  std::string v42;
  _BYTE __p[28];
  __int16 v44;
  std::string *v45;
  __int16 v46;
  void **v47;

  v5 = a5;
  v8 = a3;
  v9 = objc_retainAutorelease(a4);
  v10 = objc_msgSend(v9, "UTF8String");
  v11 = (unint64_t)objc_msgSend(v9, "lengthOfBytesUsingEncoding:", 4);
  v12 = (void *)v11;
  if (v11 >= 0x7FFFFFFFFFFFFFF8)
    sub_10002AD04();
  if (v11 >= 0x17)
  {
    v14 = (v11 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v11 | 7) != 0x17)
      v14 = v11 | 7;
    v15 = v14 + 1;
    v13 = (void **)operator new(v14 + 1);
    __dst[1] = v12;
    v41 = v15 | 0x8000000000000000;
    __dst[0] = v13;
    goto LABEL_8;
  }
  HIBYTE(v41) = v11;
  v13 = __dst;
  if (v11)
LABEL_8:
    memmove(v13, v10, (size_t)v12);
  *((_BYTE *)v12 + (_QWORD)v13) = 0;
  -[WAProtobufMessageSubmitter _fieldNameFromKey:](self, "_fieldNameFromKey:", __dst);
  if (SHIBYTE(v41) < 0)
    operator delete(__dst[0]);
  if (v5)
    v16 = "add";
  else
    v16 = "set";
  std::operator+<char>(v38, v16, &v42);
  if (v39 >= 0)
    v17 = HIBYTE(v39);
  else
    v17 = (size_t)v38[1];
  v18 = __p;
  sub_10002AD84((uint64_t)__p, v17 + 1);
  if (__p[23] < 0)
    v18 = *(_BYTE **)__p;
  if (v17)
  {
    if (v39 >= 0)
      v19 = v38;
    else
      v19 = (void **)v38[0];
    memmove(v18, v19, v17);
  }
  *(_WORD *)&v18[v17] = 58;
  if (__p[23] >= 0)
    v20 = __p;
  else
    v20 = *(const char **)__p;
  v21 = sel_registerName(v20);
  if ((__p[23] & 0x80000000) != 0)
    operator delete(*(void **)__p);
  v22 = objc_msgSend((id)objc_opt_class(v8), "instanceMethodSignatureForSelector:", v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
  if (v23)
    goto LABEL_55;
  if (SHIBYTE(v42.__r_.__value_.__r.__words[2]) < 0)
  {
    v25 = (std::string *)v42.__r_.__value_.__r.__words[0];
    if (*(_BYTE *)(v42.__r_.__value_.__r.__words[0] + v42.__r_.__value_.__l.__size_ - 1) == 115)
    {
      v24 = --v42.__r_.__value_.__l.__size_;
      goto LABEL_35;
    }
  }
  else if (v42.__r_.__value_.__s.__data_[HIBYTE(v42.__r_.__value_.__r.__words[2]) - 1] == 115)
  {
    v24 = HIBYTE(v42.__r_.__value_.__r.__words[2]) - 1;
    *((_BYTE *)&v42.__r_.__value_.__s + 23) = (*((_BYTE *)&v42.__r_.__value_.__s + 23) - 1) & 0x7F;
    v25 = &v42;
LABEL_35:
    v25->__r_.__value_.__s.__data_[v24] = 0;
    goto LABEL_37;
  }
  std::string::append(&v42, "s");
LABEL_37:
  std::operator+<char>(__p, v16, &v42);
  if (SHIBYTE(v39) < 0)
    operator delete(v38[0]);
  v39 = *(_QWORD *)&__p[16];
  *(_OWORD *)v38 = *(_OWORD *)__p;
  if (__p[23] >= 0)
    v26 = HIBYTE(*(_QWORD *)&__p[16]);
  else
    v26 = *(_QWORD *)&__p[8];
  v27 = __p;
  sub_10002AD84((uint64_t)__p, v26 + 1);
  if (__p[23] < 0)
    v27 = *(_BYTE **)__p;
  if (v26)
  {
    if (v39 >= 0)
      v28 = v38;
    else
      v28 = (void **)v38[0];
    memmove(v27, v28, v26);
  }
  *(_WORD *)&v27[v26] = 58;
  if (__p[23] >= 0)
    v29 = __p;
  else
    v29 = *(const char **)__p;
  v21 = sel_registerName(v29);
  if ((__p[23] & 0x80000000) != 0)
    operator delete(*(void **)__p);
  v30 = objc_msgSend((id)objc_opt_class(v8), "instanceMethodSignatureForSelector:", v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue(v30);
  if (v23)
  {
LABEL_55:
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSInvocation invocationWithMethodSignature:](NSInvocation, "invocationWithMethodSignature:", v23, v38[0], v38[1], v39));
    objc_msgSend(v31, "setTarget:", v8);
    objc_msgSend(v31, "setSelector:", v21);
    goto LABEL_56;
  }
  v34 = WALogCategoryDefaultHandle();
  v35 = objc_claimAutoreleasedReturnValue(v34);
  if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
  {
    v36 = &v42;
    if ((v42.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
      v36 = (std::string *)v42.__r_.__value_.__r.__words[0];
    v37 = v38;
    if (v39 < 0)
      v37 = (void **)v38[0];
    *(_DWORD *)__p = 136447234;
    *(_QWORD *)&__p[4] = "-[WAProtobufMessageSubmitter _generateSetterInvocationFromInstance:andFieldKey:isRepeatable:]";
    *(_WORD *)&__p[12] = 1024;
    *(_DWORD *)&__p[14] = 132;
    *(_WORD *)&__p[18] = 2112;
    *(_QWORD *)&__p[20] = v9;
    v44 = 2080;
    v45 = v36;
    v46 = 2080;
    v47 = v37;
    _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "%{public}s::%d:PARSER: Failed to generate method signature from fieldKey: %@ which resulted in AWD container field name: %s andSelectorString:%s", __p, 0x30u);
  }

  v23 = 0;
  v31 = 0;
LABEL_56:
  v32 = v31;
  if (SHIBYTE(v39) < 0)
    operator delete(v38[0]);
  if (SHIBYTE(v42.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v42.__r_.__value_.__l.__data_);

  return v32;
}

- (basic_string<char,)_fieldNameFromKey:(std::allocator<char>> *__return_ptr)retstr
{
  std::string *v1;
  const std::string *v2;
  basic_string<char, std::char_traits<char>, std::allocator<char>> *var0;
  std::string::size_type v4;
  unsigned __int8 *v5;
  std::string::size_type size;
  unsigned __int8 *v7;
  unsigned __int8 *v8;
  unsigned __int8 *v9;
  unsigned __int8 *v10;
  unsigned __int8 *v11;
  int v12;
  unsigned __int8 *v13;
  std::string::size_type v14;
  basic_string<char, std::char_traits<char>, std::allocator<char>> *result;
  std::string v16;
  char v17;

  v2 = v1;
  var0 = retstr;
  *(_OWORD *)retstr->var0.var0.var0.var0.var0 = 0uLL;
  *((_QWORD *)&retstr->var0.var0.var0.var1 + 2) = 0;
  v4 = HIBYTE(v1->__r_.__value_.__r.__words[2]);
  if (SHIBYTE(v1->__r_.__value_.__r.__words[2]) < 0)
  {
    v5 = (unsigned __int8 *)v1->__r_.__value_.__r.__words[0];
    size = v1->__r_.__value_.__l.__size_;
  }
  else
  {
    v5 = (unsigned __int8 *)v1;
    size = HIBYTE(v1->__r_.__value_.__r.__words[2]);
  }
  v7 = &v5[size];
  if (size)
  {
    v8 = v5;
    v9 = &v5[size];
    do
    {
      v10 = v8;
      v11 = v8;
      while (1)
      {
        v12 = *v11++;
        if (v12 == 95)
          break;
        v10 = v11;
        if (v11 == v7)
        {
          v10 = v9;
          goto LABEL_13;
        }
      }
      v8 = v10 + 1;
      v9 = v10;
    }
    while (v11 != v7);
  }
  else
  {
    v10 = v5;
  }
LABEL_13:
  v13 = (unsigned __int8 *)(v10 - v5);
  if (v10 == v7)
    v14 = 0;
  else
    v14 = (std::string::size_type)(v13 + 1);
  if ((v4 & 0x80) != 0)
    v4 = v2->__r_.__value_.__l.__size_;
  std::string::basic_string(&v16, v2, v14, v4, (std::allocator<char> *)&v17);
  var0->var0.var0 = (__rep)v16;
  if (*((char *)&var0->var0.var0.var0.var1 + 23) < 0)
    var0 = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)var0->var0.var0.var0.var1.var0;
  result = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)__toupper(var0->var0.var0.var0.var0.var0[0]);
  var0->var0.var0.var0.var0.var0[0] = (char)result;
  return result;
}

@end
