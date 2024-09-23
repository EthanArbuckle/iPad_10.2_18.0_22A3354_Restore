@implementation HIDSingleReportDevice

- (void)handleInputReportData:(id)a3 reportID:(unsigned __int8)a4 timestamp:(unint64_t)a5
{
  int v6;
  id v8;
  void *v9;
  id v10;
  _BYTE *v11;
  __IOHIDUserDevice *v12;
  id v13;
  const uint8_t *v14;
  id v15;
  uint64_t v16;

  v6 = a4;
  v8 = a3;
  v9 = v8;
  if (v6)
  {
    v10 = objc_msgSend(v8, "length");
    v11 = (char *)&v16 - (((unint64_t)v10 + 16) & 0xFFFFFFFFFFFFFFF0);
    bzero(v11, (size_t)v10 + 1);
    *v11 = v6;
    objc_msgSend(v9, "getBytes:length:", v11 + 1, v10);

    IOHIDUserDeviceHandleReportWithTimeStamp(-[HIDGenericDevice device](self, "device"), a5, v11, (CFIndex)v10 + 1);
  }
  else
  {
    v12 = -[HIDGenericDevice device](self, "device");
    v13 = objc_retainAutorelease(v9);
    v14 = (const uint8_t *)objc_msgSend(v13, "bytes");
    v15 = objc_msgSend(v13, "length");

    IOHIDUserDeviceHandleReportWithTimeStamp(v12, a5, v14, (CFIndex)v15);
  }
}

- (int)getReport:(char *)a3 reportLength:(int64_t *)a4 reportID:(unsigned __int8)a5 reportType:(int)a6
{
  int v8;
  id v9;
  void *v10;
  id v12;

  v12 = 0;
  v8 = -[HIDBluetoothDevice getReportData:reportID:reportType:error:](self, "getReportData:reportID:reportType:error:", &v12, a5, *(_QWORD *)&a6, 0);
  v9 = v12;
  v10 = v9;
  if (!v8)
  {
    if ((unint64_t)objc_msgSend(v9, "length") <= *a4)
    {
      objc_msgSend(v10, "getBytes:length:", a3);
      v8 = 0;
      *a4 = (int64_t)objc_msgSend(v10, "length");
    }
    else
    {
      v8 = -536870181;
    }
  }

  return v8;
}

- (int)setReport:(char *)a3 reportLength:(int64_t)a4 reportID:(unsigned __int8)a5 reportType:(int)a6
{
  uint64_t v6;
  uint64_t v7;
  void *v9;

  v6 = *(_QWORD *)&a6;
  v7 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytesNoCopy:length:freeWhenDone:](NSData, "dataWithBytesNoCopy:length:freeWhenDone:", a3, a4, 0));
  LODWORD(v6) = -[HIDBluetoothDevice setReportData:reportID:reportType:error:](self, "setReportData:reportID:reportType:error:", v9, v7, v6, 0);

  return v6;
}

@end
