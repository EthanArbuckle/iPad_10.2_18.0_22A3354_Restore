@implementation OCSPFetchDelegate

- (BOOL)fetchNext:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  _BOOL4 v11;
  id v12;
  void *v13;
  char *v14;
  void *v15;
  objc_super v17;

  v6 = a4;
  v7 = a3;
  v8 = objc_msgSend(v6, "context");
  v9 = v8[2];
  if (v9)
    v10 = *(_QWORD *)(v9 + 272);
  else
    v10 = 0;
  v17.receiver = self;
  v17.super_class = (Class)OCSPFetchDelegate;
  v11 = -[TrustURLSessionDelegate fetchNext:context:](&v17, "fetchNext:context:", v7, v6);

  if (v11)
  {
    *((_BYTE *)v8 + 88) = 1;
  }
  else
  {
    v12 = objc_msgSend(v6, "URIix");
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "URIs"));
    if (v12)
      v14 = (char *)objc_msgSend(v6, "URIix") - 1;
    else
      v14 = 0;
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndexedSubscript:", v14));
    v8[10] = v15;

    if (v10)
      ++*(_DWORD *)(v10 + 52);
  }

  return v11;
}

- (id)createNextRequest:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  _QWORD *v8;
  CFDataRef Copy;
  __CFData *Mutable;
  __CFData *v11;
  UInt8 *MutableBytePtr;
  CFIndex v13;
  const __CFData *v14;
  const __CFData *v15;
  const __CFData *v16;
  const __CFData *v17;
  const __CFData *v18;
  const __CFData *v19;
  __CFData *v20;
  __CFData *v21;
  UInt8 *v22;
  CFIndex v23;
  __CFData *v24;
  UInt8 *v25;
  CFIndex v26;
  __CFData *v27;
  __CFData *v28;
  UInt8 *v29;
  CFIndex v30;
  __CFData *v31;
  __CFData *v32;
  UInt8 *v33;
  CFIndex v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  char *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  id v44;
  id v45;
  void *v46;
  __CFData *v48;
  objc_super v49;
  objc_super v50;
  CFIndex v51;
  _OWORD v52[2];
  CFIndex length;
  _OWORD v54[2];
  __int128 v55;
  __int128 v56;
  CFIndex capacity;
  _QWORD v58[5];
  unint64_t v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  unint64_t v64;
  _QWORD v65[6];

  v6 = a3;
  v7 = a4;
  v8 = (_QWORD *)*((_QWORD *)objc_msgSend(v7, "context") + 4);
  if (!v8)
  {
    Copy = 0;
    goto LABEL_39;
  }
  Copy = (CFDataRef)v8[2];
  if (Copy)
  {
LABEL_37:
    CFRetain(Copy);
    goto LABEL_39;
  }
  memset(v52, 0, sizeof(v52));
  v56 = 0u;
  v55 = 0u;
  memset(v54, 0, sizeof(v54));
  memset(v58, 0, 32);
  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  v65[2] = 0;
  v65[3] = 0;
  v65[0] = &unk_10006003A;
  v65[1] = 5;
  v64 = 0;
  if (DERLengthOfEncodedSequenceFromObject(0x2000000000000010, (unint64_t)v65, 0x20uLL, (unsigned __int16)DERNumAlgorithmIdItemSpecs, (uint64_t)&DERAlgorithmIdItemSpecs, &v64))goto LABEL_56;
  if (v64 > 0x7FFFFFFFFFFFFFFELL)
    goto LABEL_56;
  Mutable = CFDataCreateMutable(0, v64);
  if (!Mutable)
    goto LABEL_56;
  v11 = Mutable;
  CFDataSetLength(Mutable, v64);
  MutableBytePtr = CFDataGetMutableBytePtr(v11);
  v13 = CFDataGetLength(v11);
  if (DEREncodeSequenceFromObject(0x2000000000000010, (unint64_t)v65, 0x20uLL, (unsigned __int16)DERNumAlgorithmIdItemSpecs, (uint64_t)&DERAlgorithmIdItemSpecs, (unint64_t)MutableBytePtr, v13, &v64)|| CFDataGetLength(v11) < 1|| (v14 = (const __CFData *)SecCertificateCopyIssuerSHA1Digest(*v8)) == 0)
  {
LABEL_52:
    v48 = v11;
    goto LABEL_55;
  }
  v15 = v14;
  if (CFDataGetLength(v14) >= 1)
  {
    v16 = (const __CFData *)SecCertificateCopyPublicKeySHA1Digest(v8[1]);
    if (v16)
    {
      v17 = v16;
      if (CFDataGetLength(v16) < 1)
      {
        v19 = 0;
      }
      else
      {
        v18 = SecCertificateCopySerialNumberData((SecCertificateRef)*v8, 0);
        v19 = v18;
        if (v18)
        {
          if (CFDataGetLength(v18) >= 1)
          {
            CFRetain(v15);
            v8[5] = v15;
            CFRetain(v17);
            v8[6] = v17;
            CFRetain(v19);
            v8[7] = v19;
            *(_QWORD *)&v60 = CFDataGetBytePtr(v11);
            *((_QWORD *)&v60 + 1) = CFDataGetLength(v11);
            *(_QWORD *)&v61 = CFDataGetBytePtr(v15);
            *((_QWORD *)&v61 + 1) = CFDataGetLength(v15);
            *(_QWORD *)&v62 = CFDataGetBytePtr(v17);
            *((_QWORD *)&v62 + 1) = CFDataGetLength(v17);
            *(_QWORD *)&v63 = CFDataGetBytePtr(v19);
            *((_QWORD *)&v63 + 1) = CFDataGetLength(v19);
            v59 = 0;
            if (!DERLengthOfEncodedSequenceFromObject(0x2000000000000010, (unint64_t)&v60, 0x40uLL, 4, (uint64_t)&unk_100061E70, &v59)&& v59 <= 0x7FFFFFFFFFFFFFFELL)
            {
              v20 = CFDataCreateMutable(0, v59);
              v21 = v20;
              if (!v20
                || (CFDataSetLength(v20, v59),
                    v22 = CFDataGetMutableBytePtr(v21),
                    v23 = CFDataGetLength(v21),
                    !DEREncodeSequenceFromObject(0x2000000000000010, (unint64_t)&v60, 0x40uLL, 4u, (uint64_t)&unk_100061E70, (unint64_t)v22, v23, &v59)))
              {
LABEL_18:
                CFRelease(v15);
                CFRelease(v17);
                v15 = v19;
                if (!v19)
                  goto LABEL_20;
                goto LABEL_19;
              }
              CFRelease(v21);
            }
          }
        }
      }
      v21 = 0;
      goto LABEL_18;
    }
  }
  v21 = 0;
LABEL_19:
  CFRelease(v15);
LABEL_20:
  CFRelease(v11);
  if (v21)
  {
    if (CFDataGetLength(v21) >= 1)
    {
      v58[0] = CFDataGetBytePtr(v21);
      v58[1] = CFDataGetLength(v21);
      capacity = 0;
      if (!DERLengthOfEncodedSequenceFromObject(0x2000000000000010, (unint64_t)v58, 0x20uLL, 2, (uint64_t)&unk_100061C50, (unint64_t *)&capacity)&& (unint64_t)capacity <= 0x7FFFFFFFFFFFFFFELL)
      {
        v24 = CFDataCreateMutable(0, capacity);
        if (v24)
        {
          v11 = v24;
          CFDataSetLength(v24, capacity);
          v25 = CFDataGetMutableBytePtr(v11);
          v26 = CFDataGetLength(v11);
          if (!DEREncodeSequenceFromObject(0x2000000000000010, (unint64_t)v58, 0x20uLL, 2u, (uint64_t)&unk_100061C50, (unint64_t)v25, v26, (unint64_t *)&capacity))
          {
            CFRelease(v21);
            if (CFDataGetLength(v11) >= 1)
            {
              *(_QWORD *)&v55 = CFDataGetBytePtr(v11);
              *((_QWORD *)&v55 + 1) = CFDataGetLength(v11);
              length = 0;
              if (!DERLengthOfEncodedSequenceFromObject(0x2000000000000010, (unint64_t)v54, 0x40uLL, 4, (uint64_t)&unk_100061BF0, (unint64_t *)&length)&& (unint64_t)length <= 0x7FFFFFFFFFFFFFFELL)
              {
                v27 = CFDataCreateMutable(0, length);
                if (v27)
                {
                  v28 = v27;
                  CFDataSetLength(v27, length);
                  v29 = CFDataGetMutableBytePtr(v28);
                  v30 = CFDataGetLength(v28);
                  if (!DEREncodeSequenceFromObject(0x2000000000000010, (unint64_t)v54, 0x40uLL, 4u, (uint64_t)&unk_100061BF0, (unint64_t)v29, v30, (unint64_t *)&length))
                  {
                    CFRelease(v11);
                    if (CFDataGetLength(v28) >= 1)
                    {
                      *(_QWORD *)&v52[0] = CFDataGetBytePtr(v28);
                      *((_QWORD *)&v52[0] + 1) = CFDataGetLength(v28);
                      v51 = 0;
                      if (!DERLengthOfEncodedSequenceFromObject(0x2000000000000010, (unint64_t)v52, 0x20uLL, 2, (uint64_t)&unk_100061BC0, (unint64_t *)&v51)&& (unint64_t)v51 <= 0x7FFFFFFFFFFFFFFELL)
                      {
                        v31 = CFDataCreateMutable(0, v51);
                        if (v31)
                        {
                          v32 = v31;
                          CFDataSetLength(v31, v51);
                          v33 = CFDataGetMutableBytePtr(v32);
                          v34 = CFDataGetLength(v32);
                          if (!DEREncodeSequenceFromObject(0x2000000000000010, (unint64_t)v52, 0x20uLL, 2u, (uint64_t)&unk_100061BC0, (unint64_t)v33, v34, (unint64_t *)&v51))
                          {
                            CFRelease(v28);
                            Copy = CFDataCreateCopy(0, v32);
                            CFRelease(v32);
                            v8[2] = Copy;
                            if (!Copy)
                              goto LABEL_39;
                            goto LABEL_37;
                          }
                          CFRelease(v32);
                        }
                      }
                    }
                    v48 = v28;
                    goto LABEL_55;
                  }
                  CFRelease(v28);
                }
              }
            }
            goto LABEL_52;
          }
          CFRelease(v11);
        }
      }
    }
    v48 = v21;
LABEL_55:
    CFRelease(v48);
  }
LABEL_56:
  Copy = 0;
  v8[2] = 0;
LABEL_39:
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[__CFData base64EncodedStringWithOptions:](Copy, "base64EncodedStringWithOptions:", 0));
  if (qword_100082D50 != -1)
    dispatch_once(&qword_100082D50, &stru_100077430);
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "stringByAddingPercentEncodingWithAllowedCharacters:", qword_100082D48));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "absoluteString"));
  v38 = objc_msgSend(v37, "length");
  v39 = (char *)objc_msgSend(v36, "length") + (_QWORD)v38 + 1;

  if ((unint64_t)v39 > 0xFF)
  {
    v49.receiver = self;
    v49.super_class = (Class)OCSPFetchDelegate;
    v45 = -[TrustURLSessionDelegate createNextRequest:context:](&v49, "createNextRequest:context:", v6, v7);
    v46 = (void *)objc_claimAutoreleasedReturnValue(v45);
    v44 = objc_msgSend(v46, "mutableCopy");

    objc_msgSend(v44, "setHTTPMethod:", CFSTR("POST"));
    objc_msgSend(v44, "setHTTPBody:", Copy);
  }
  else
  {
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "absoluteString"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/%@"), v40, v36));

    v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v41));
    v50.receiver = self;
    v50.super_class = (Class)OCSPFetchDelegate;
    v43 = -[TrustURLSessionDelegate createNextRequest:context:](&v50, "createNextRequest:context:", v42, v7);
    v44 = (id)objc_claimAutoreleasedReturnValue(v43);

  }
  return v44;
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  double v22;
  uint64_t v23;
  unsigned int *v24;
  unsigned int v25;
  unsigned int v26;
  _QWORD *v27;
  NSObject *v28;
  const void *v29;
  NSObject *v30;
  const __CFData *v31;
  _QWORD *v32;
  uint64_t v33;
  double v34;
  _QWORD block[5];
  objc_super v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  id v40;
  __int128 v41;
  uint64_t v42;
  id v43;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v36.receiver = self;
  v36.super_class = (Class)OCSPFetchDelegate;
  -[TrustURLSessionDelegate URLSession:task:didCompleteWithError:](&v36, "URLSession:task:didCompleteWithError:", v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "originalRequest"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "taskId"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[TrustURLSessionDelegate contextForTask:](self, "contextForTask:", v12));
  v14 = v13;
  if (v13)
  {
    *(_QWORD *)&v41 = 0;
    *((_QWORD *)&v41 + 1) = &v41;
    v42 = 0x2020000000;
    v43 = (id)0xAAAAAAAAAAAAAAAALL;
    v43 = objc_msgSend(v13, "context");
    v15 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 24);
    if (!v15 || (v16 = *(_QWORD *)(v15 + 16)) == 0)
    {
      -[TrustURLSessionDelegate removeTask:](self, "removeTask:", v12);
LABEL_20:
      _Block_object_dispose(&v41, 8);
      goto LABEL_24;
    }
    v17 = *(_QWORD *)(v16 + 272);
    if (v10)
    {
      v18 = sub_100011628("rvc");
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "originalRequest"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "URL"));
        *(_DWORD *)buf = 138412546;
        v38 = v21;
        v39 = 2112;
        v40 = v10;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Failed to download ocsp response %@, with error %@", buf, 0x16u);

      }
    }
    else
    {
      v31 = (const __CFData *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "response"));
      v32 = sub_100008550(v31, -1);

      if (v32)
      {
        v33 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 24);
        objc_msgSend(v14, "maxAge");
        sub_100015F64(v33, (uint64_t)v32, 1, 0, v34);
        if (v17 && !*(_BYTE *)(*(_QWORD *)(*((_QWORD *)&v41 + 1) + 24) + 88))
          *(_BYTE *)(v17 + 68) = 1;
        goto LABEL_10;
      }
    }
    if (v17)
      ++*(_DWORD *)(v17 + 64);
LABEL_10:
    v23 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 24);
    if (*(_BYTE *)(v23 + 88)
      || (-[OCSPFetchDelegate fetchNext:context:](self, "fetchNext:context:", v8, v14),
          v23 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 24),
          *(_BYTE *)(v23 + 88)))
    {
      sub_100015AEC(v23, v22);
      v24 = (unsigned int *)(*(_QWORD *)(*(_QWORD *)(*((_QWORD *)&v41 + 1) + 24) + 16) + 208);
      do
      {
        v25 = __ldaxr(v24);
        v26 = v25 - 1;
      }
      while (__stlxr(v26, v24));
      if (!v26)
      {
        v27 = *(_QWORD **)(*(_QWORD *)(*((_QWORD *)&v41 + 1) + 24) + 16);
        if (v27)
          v27 = (_QWORD *)v27[2];
        v28 = v27;
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10003E9D4;
        block[3] = &unk_100077360;
        block[4] = &v41;
        dispatch_async(v28, block);

      }
    }
    -[TrustURLSessionDelegate removeTask:](self, "removeTask:", v12);
    goto LABEL_20;
  }
  v29 = sub_100011628("http");
  v30 = objc_claimAutoreleasedReturnValue(v29);
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(v41) = 138412290;
    *(_QWORD *)((char *)&v41 + 4) = v12;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "failed to find context for %@", (uint8_t *)&v41, 0xCu);
  }

LABEL_24:
}

- (void)URLSession:(id)a3 task:(id)a4 didFinishCollectingMetrics:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD *v13;
  uint64_t v14;
  void *v15;
  double v16;
  const void *v17;
  NSObject *v18;
  int v19;
  void *v20;

  v7 = a5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "originalRequest"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "taskId"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TrustURLSessionDelegate contextForTask:](self, "contextForTask:", v9));
  v11 = v10;
  if (v10)
  {
    v12 = objc_msgSend(v10, "context");
    if (v12)
    {
      v13 = (_QWORD *)*((_QWORD *)v12 + 2);
      if (v13)
      {
        CFRetain(*((CFTypeRef *)v12 + 2));
        v14 = v13[34];
        if (v14)
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "taskInterval"));
          objc_msgSend(v15, "duration");
          *(_QWORD *)(v14 + 56) += (unint64_t)(v16 * 1000000000.0);

        }
        CFRelease(v13);
      }
    }
  }
  else
  {
    v17 = sub_100011628("http");
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 138412290;
      v20 = v9;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "failed to find context for %@", (uint8_t *)&v19, 0xCu);
    }

  }
}

@end
