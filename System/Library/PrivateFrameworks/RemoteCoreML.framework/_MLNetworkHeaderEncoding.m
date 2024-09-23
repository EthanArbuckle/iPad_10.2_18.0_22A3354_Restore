@implementation _MLNetworkHeaderEncoding

+ (id)constructDataPacket:(id)a3 HeaderEncoding:(unint64_t)a4
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v9;
  unint64_t v10;

  v10 = a4;
  v4 = a3;
  v9 = objc_msgSend(v4, "length");
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithBytes:length:", &v10, 8);
  objc_msgSend(v5, "appendBytes:length:", &v9, 8);
  v6 = objc_retainAutorelease(v4);
  v7 = objc_msgSend(v6, "bytes");

  objc_msgSend(v5, "appendBytes:length:", v7, v9);
  return v5;
}

+ (id)textDebug:(id)a3
{
  return +[_MLNetworkHeaderEncoding constructDataPacket:HeaderEncoding:](_MLNetworkHeaderEncoding, "constructDataPacket:HeaderEncoding:", a3, kMLTextNetworkHeaderEncoding);
}

+ (id)loadModel:(id)a3
{
  return +[_MLNetworkHeaderEncoding constructDataPacket:HeaderEncoding:](_MLNetworkHeaderEncoding, "constructDataPacket:HeaderEncoding:", a3, kMLLoadNetworkHeaderEncoding);
}

+ (id)unLoadModel:(id)a3
{
  return +[_MLNetworkHeaderEncoding constructDataPacket:HeaderEncoding:](_MLNetworkHeaderEncoding, "constructDataPacket:HeaderEncoding:", a3, kMLUnLoadNetworkHeaderEncoding);
}

+ (id)predictFeature:(id)a3
{
  return +[_MLNetworkHeaderEncoding constructDataPacket:HeaderEncoding:](_MLNetworkHeaderEncoding, "constructDataPacket:HeaderEncoding:", a3, kMLPredictNetworkHeaderEncoding);
}

+ (id)custom:(id)a3
{
  return +[_MLNetworkHeaderEncoding constructDataPacket:HeaderEncoding:](_MLNetworkHeaderEncoding, "constructDataPacket:HeaderEncoding:", a3, kMLCustomNetworkHeaderEncoding);
}

+ (id)acknowledgeSucessData
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc(MEMORY[0x24BDBCE50]);
  objc_msgSend(CFSTR("SUCCESS"), "dataUsingEncoding:", 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithData:", v3);

  +[_MLNetworkHeaderEncoding constructDataPacket:HeaderEncoding:](_MLNetworkHeaderEncoding, "constructDataPacket:HeaderEncoding:", v4, kMLAckSuccessNetworkHeaderEncoding);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)acknowledgeFailData
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc(MEMORY[0x24BDBCE50]);
  objc_msgSend(CFSTR("FAIL"), "dataUsingEncoding:", 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithData:", v3);

  +[_MLNetworkHeaderEncoding constructDataPacket:HeaderEncoding:](_MLNetworkHeaderEncoding, "constructDataPacket:HeaderEncoding:", v4, kMLAckFailNetworkHeaderEncoding);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (unint64_t)getHeaderEncoding:(id)a3
{
  id v3;
  unint64_t *v4;
  unint64_t v5;
  BOOL v6;

  v3 = objc_retainAutorelease(a3);
  if (!objc_msgSend(v3, "bytes")
    || ((v4 = (unint64_t *)objc_msgSend(objc_retainAutorelease(v3), "bytes"),
         v5 = *v4,
         *v4 >= kMLTextNetworkHeaderEncoding)
      ? (v6 = v5 > kMLIncomingDataNetworkHeaderEncoding)
      : (v6 = 1),
        v6))
  {
    v5 = kMLErrorNetworkHeaderEncoding;
  }

  return v5;
}

+ (unint64_t)getHeaderSize
{
  return 16;
}

+ (unint64_t)getHeaderDataSize:(id)a3
{
  id v3;
  unint64_t v4;

  v3 = objc_retainAutorelease(a3);
  if (objc_msgSend(v3, "bytes"))
    v4 = *(_QWORD *)(objc_msgSend(objc_retainAutorelease(v3), "bytes") + 8);
  else
    v4 = 0;

  return v4;
}

+ (void)getHeaderDataStart:(id)a3
{
  id v3;
  void *v4;

  v3 = objc_retainAutorelease(a3);
  if (objc_msgSend(v3, "bytes"))
    v4 = (void *)(objc_msgSend(objc_retainAutorelease(v3), "bytes") + 16);
  else
    v4 = 0;

  return v4;
}

+ (void)getHeaderEnd:(id)a3
{
  id v3;
  unint64_t v4;
  id v5;
  void *v6;

  v3 = a3;
  v4 = +[_MLNetworkHeaderEncoding getHeaderDataSize:](_MLNetworkHeaderEncoding, "getHeaderDataSize:", v3);
  v5 = objc_retainAutorelease(v3);
  if (objc_msgSend(v5, "bytes"))
    v6 = (void *)(objc_msgSend(objc_retainAutorelease(v5), "bytes") + v4 + 16);
  else
    v6 = 0;

  return v6;
}

+ (BOOL)isHeaderText:(unint64_t)a3
{
  return kMLTextNetworkHeaderEncoding == a3;
}

+ (BOOL)isHeaderLoad:(unint64_t)a3
{
  return kMLLoadNetworkHeaderEncoding == a3;
}

+ (BOOL)isHeaderUnLoad:(unint64_t)a3
{
  return kMLUnLoadNetworkHeaderEncoding == a3;
}

+ (BOOL)isHeaderPredictFeature:(unint64_t)a3
{
  return kMLPredictNetworkHeaderEncoding == a3;
}

+ (BOOL)isHeaderCustom:(unint64_t)a3
{
  return kMLCustomNetworkHeaderEncoding == a3;
}

+ (BOOL)isHeaderAcknowledgeSucessData:(unint64_t)a3
{
  return kMLAckSuccessNetworkHeaderEncoding == a3;
}

+ (BOOL)isHeaderAcknowledgeFailData:(unint64_t)a3
{
  return kMLAckFailNetworkHeaderEncoding == a3;
}

+ (BOOL)isHeaderIncomingData:(unint64_t)a3
{
  return kMLIncomingDataNetworkHeaderEncoding == a3;
}

+ (BOOL)isHeaderError:(unint64_t)a3
{
  return kMLErrorNetworkHeaderEncoding == a3;
}

@end
