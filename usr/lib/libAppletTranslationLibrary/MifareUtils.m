@implementation MifareUtils

+ (id)getMcmDataDal:(unsigned __int16)a3 withTransceiver:(id)a4 withError:(id *)a5
{
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = (void *)MEMORY[0x1E0C99DF0];
  v8 = a4;
  objc_msgSend(v7, "dataWithBytesNoCopy:length:freeWhenDone:", &getMcmDataDal_withTransceiver_withError__getMcDataDal, 5, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendShortBE:", v6);
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", &getMcmDataDal_withTransceiver_withError__getResponse, 5, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "transceiveAndGetAllData:withGetMoreData:withMoreDataSW:withError:", v9, v10, 24832, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
