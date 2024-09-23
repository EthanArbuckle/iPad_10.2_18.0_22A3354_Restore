@implementation APProtobufSerialization

+ (id)deserializeProtobufferData:(id)a3 ofClass:(Class)a4 error:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  unsigned int v20;
  uint8_t buf[4];
  int v22;

  v7 = a3;
  v8 = v7;
  if (!v7 || (unint64_t)objc_msgSend(v7, "length") <= 7)
  {
    if (a5)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Protobuffer is nil or less than %u bytes."), 8));
      *a5 = (id)objc_claimAutoreleasedReturnValue(+[APLegacyInterfaceError validationErrorWithCode:andReason:](APLegacyInterfaceError, "validationErrorWithCode:andReason:", 4500, v9));

    }
    v10 = APLogForCategory(21);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v22 = 8;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Protobuffer is nil or less than %u bytes.", buf, 8u);
    }

LABEL_8:
    v12 = 0;
    goto LABEL_9;
  }
  v20 = 0;
  *(_DWORD *)buf = 0;
  objc_msgSend(v8, "getBytes:range:", buf, 0, 4);
  *(_DWORD *)buf = bswap32(*(unsigned int *)buf);
  objc_msgSend(v8, "getBytes:range:", &v20, 4, 4);
  v14 = bswap32(v20);
  v20 = v14;
  if (v14 + 8 > (unint64_t)objc_msgSend(v8, "length"))
  {
    if (a5)
    {
      v12 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue(+[APLegacyInterfaceError validationErrorWithCode:andReason:](APLegacyInterfaceError, "validationErrorWithCode:andReason:", 4500, CFSTR("Bad protocol response header for content %@; is the server up-to-date?")));
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  v15 = objc_alloc((Class)PBDataReader);
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "subdataWithRange:", 8, v14));
  v17 = objc_msgSend(v15, "initWithData:", v16);

  v18 = objc_alloc_init(a4);
  if (objc_msgSend(v18, "readFrom:", v17))
  {
    v12 = v18;
  }
  else
  {
    if (a5)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Protocol buffer invalid or of the incorrect type '%@'"), a4));
      *a5 = (id)objc_claimAutoreleasedReturnValue(+[APLegacyInterfaceError validationErrorWithCode:andReason:](APLegacyInterfaceError, "validationErrorWithCode:andReason:", 4501, v19));

    }
    v12 = 0;
  }

LABEL_9:
  return v12;
}

+ (id)serializeProtobuffer:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  unsigned int v11;
  unsigned int v12;

  v3 = a3;
  v4 = objc_msgSend((id)objc_opt_class(v3), "options");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("messageIndex")));

  v7 = objc_alloc_init((Class)PBDataWriter);
  objc_msgSend(v3, "writeTo:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "data"));
  v12 = bswap32(objc_msgSend(v6, "integerValue"));
  v11 = bswap32(objc_msgSend(v8, "length"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData data](NSMutableData, "data"));
  objc_msgSend(v9, "appendBytes:length:", &v12, 4);
  objc_msgSend(v9, "appendBytes:length:", &v11, 4);
  objc_msgSend(v9, "appendData:", v8);

  return v9;
}

@end
