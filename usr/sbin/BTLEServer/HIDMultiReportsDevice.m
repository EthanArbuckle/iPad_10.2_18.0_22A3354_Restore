@implementation HIDMultiReportsDevice

- (void)handleInputReportData:(id)a3 reportID:(unsigned __int8)a4 timestamp:(unint64_t)a5
{
  id v8;
  id v9;
  unsigned __int8 *v10;
  uint64_t v11;

  v8 = a3;
  v9 = objc_msgSend(v8, "length");
  v10 = (unsigned __int8 *)&v11 - (((unint64_t)v9 + 16) & 0xFFFFFFFFFFFFFFF0);
  bzero(v10, (size_t)v9 + 1);
  *v10 = a4;
  objc_msgSend(v8, "getBytes:length:", v10 + 1, v9);

  IOHIDUserDeviceHandleReportWithTimeStamp(-[HIDGenericDevice device](self, "device"), a5, v10, (CFIndex)v9 + 1);
}

- (int)getReport:(char *)a3 reportLength:(int64_t *)a4 reportID:(unsigned __int8)a5 reportType:(int)a6
{
  int v9;
  id v10;
  void *v11;
  id v13;

  v13 = 0;
  v9 = -[HIDBluetoothDevice getReportData:reportID:reportType:error:](self, "getReportData:reportID:reportType:error:", &v13, a5, *(_QWORD *)&a6, 0);
  v10 = v13;
  v11 = v10;
  if (!v9)
  {
    if ((unint64_t)objc_msgSend(v10, "length") + 1 <= *a4)
    {
      *a3 = a5;
      objc_msgSend(v11, "getBytes:length:", a3 + 1, *a4 - 1);
      v9 = 0;
      *a4 = (int64_t)objc_msgSend(v11, "length") + 1;
    }
    else
    {
      v9 = -536870181;
    }
  }

  return v9;
}

- (int)setReport:(char *)a3 reportLength:(int64_t)a4 reportID:(unsigned __int8)a5 reportType:(int)a6
{
  uint64_t v6;
  uint64_t v7;
  void *v9;

  v6 = *(_QWORD *)&a6;
  v7 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytesNoCopy:length:freeWhenDone:](NSData, "dataWithBytesNoCopy:length:freeWhenDone:", a3 + 1, a4 - 1, 0));
  LODWORD(v6) = -[HIDBluetoothDevice setReportData:reportID:reportType:error:](self, "setReportData:reportID:reportType:error:", v9, v7, v6, 0);

  return v6;
}

@end
