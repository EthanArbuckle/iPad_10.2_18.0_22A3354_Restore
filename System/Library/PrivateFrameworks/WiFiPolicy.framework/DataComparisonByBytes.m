@implementation DataComparisonByBytes

+ (id)dataComparisonByBytesWithData1:(id)a3 data2:(id)a4 reference:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  id v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  unsigned int v20;
  unsigned int v21;
  int v22;
  BOOL v23;
  int v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  id v28;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithObj1:obj2:reference:", v8, v9, v10);
  if (v11)
  {
    v12 = objc_msgSend(v8, "length");
    v13 = objc_msgSend(v9, "length");
    if (v12 >= v13)
      v14 = v13;
    else
      v14 = v12;
    if (v14)
    {
      v15 = 0;
      do
      {
        v16 = objc_retainAutorelease(v8);
        v17 = objc_msgSend(v16, "bytes");
        v18 = objc_retainAutorelease(v9);
        v19 = objc_msgSend(v18, "bytes");
        objc_msgSend(v11, "incrementTokensWith:", *(unsigned __int8 *)(v17 + v15) == *(unsigned __int8 *)(v19 + v15));
        v20 = *(unsigned __int8 *)(v17 + v15);
        v21 = *(unsigned __int8 *)(v19 + v15);
        v22 = v21 - v20;
        v23 = v20 >= v21;
        v24 = v20 - v21;
        if (!v23)
          v24 = v22;
        objc_msgSend(v11, "incrementDistanceWith:", v24);
        ++v15;
        v25 = objc_msgSend(v16, "length");
        v26 = objc_msgSend(v18, "length");
        if (v25 >= v26)
          v27 = v26;
        else
          v27 = v25;
      }
      while (v15 < v27);
    }
    objc_msgSend(v11, "accountForadditionalLength");
    v28 = v11;
  }

  return v11;
}

@end
