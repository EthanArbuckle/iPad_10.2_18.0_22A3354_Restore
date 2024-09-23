@implementation MSDIsEnrolledRequest

- (Class)getResponseClass
{
  return (Class)objc_opt_class(MSDIsEnrolledResponse, a2);
}

- (id)parseResponseForError:(id)a3 andPayload:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;
  NSObject *v17;
  id v19;
  NSObject *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  objc_super v25;

  v6 = a3;
  v7 = a4;
  v25.receiver = self;
  v25.super_class = (Class)MSDIsEnrolledRequest;
  v8 = -[MSDServerRequest parseResponseForError:andPayload:](&v25, "parseResponseForError:andPayload:", v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "error"));

  if (v10)
  {
    v14 = 0;
    v11 = 0;
    v12 = v6;
  }
  else
  {
    v24 = v6;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDCommandServerRequest getDataDictFromPayload:error:](self, "getDataDictFromPayload:error:", v7, &v24));
    v12 = v24;

    if (v11)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", CFSTR("Result")));
      if (v14)
      {
        v15 = objc_opt_class(NSNumber, v13);
        if ((objc_opt_isKindOfClass(v14, v15) & 1) != 0)
        {
          if (objc_msgSend(v14, "BOOLValue"))
          {
            v16 = sub_1000604F0();
            v17 = objc_claimAutoreleasedReturnValue(v16);
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
              sub_1000C63B8(v17);

          }
          objc_msgSend(v9, "setIsEnrolled:", objc_msgSend(v14, "BOOLValue"));
          goto LABEL_10;
        }
      }
      v19 = sub_1000604F0();
      v20 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        sub_1000C630C(self, (uint64_t)v11, v20);

    }
    else
    {
      v14 = 0;
    }
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "error"));

  if (!v21)
  {
    v23 = v12;
    sub_1000B63A4(&v23, 3727744512, (uint64_t)CFSTR("Unexpected server response."));
    v22 = v23;

    objc_msgSend(v9, "setError:", v22);
    v12 = v22;
  }
LABEL_10:

  return v9;
}

@end
