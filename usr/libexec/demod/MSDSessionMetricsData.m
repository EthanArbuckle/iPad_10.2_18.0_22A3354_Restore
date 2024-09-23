@implementation MSDSessionMetricsData

- (MSDSessionMetricsData)initWithData:(id)a3
{
  id v4;
  NSString *v5;
  void *v6;
  uint64_t v7;
  id v8;

  v4 = a3;
  v5 = NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Override %@ in a subclass"), v6));

  v8 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v7, 0));
  objc_exception_throw(v8);
}

- (void)saveToFile:(id)a3
{
  id v4;

  v4 = a3;
  if (!objc_msgSend(v4, "offsetInFile"))
    -[MSDSessionMetricsData writeFileHeaders:](self, "writeFileHeaders:", v4);

}

- (void)writeFileHeaders:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", CFSTR("DNSResolutionTime"), CFSTR("ConectionEstablishmentTime"), CFSTR("TCPConnectionTime"), CFSTR("SecureConnectionTime"), CFSTR("RequestTime"), CFSTR("ResponseTime"), CFSTR("RequestBytesSent"), CFSTR("ResponseBytesReceived"), 0));
  v5 = objc_alloc_init((Class)NSMutableString);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(v5, "appendFormat:", CFSTR("%@,"), *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v10));
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

  objc_msgSend(v5, "appendString:", CFSTR("\n"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dataUsingEncoding:", 4));
  objc_msgSend(v3, "writeData:", v11);

}

@end
