@implementation TSUIOUtils

+ (void)readAllFromChannel:(id)a3 offset:(int64_t)a4 length:(unint64_t)a5 completion:(id)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  _QWORD *v21;
  _QWORD v22[5];
  id v23;

  v9 = a3;
  v10 = a6;
  v11 = v10;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSUIOUtils readAllFromChannel:offset:length:completion:]");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUIOUtils.m");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v15, v16, 77, 0, "invalid nil value for '%{public}s'", "readChannel");

    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
    if (v11)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSUIOUtils readAllFromChannel:offset:length:completion:]");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUIOUtils.m");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v17, v18, 78, 0, "invalid nil value for '%{public}s'", "completion");

    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
    goto LABEL_3;
  }
  if (!v10)
    goto LABEL_5;
LABEL_3:
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = __Block_byref_object_copy__19;
  v22[4] = __Block_byref_object_dispose__19;
  v12 = (void *)MEMORY[0x24BDAC990];
  v13 = MEMORY[0x24BDAC990];
  v23 = v12;
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __58__TSUIOUtils_readAllFromChannel_offset_length_completion___block_invoke;
  v19[3] = &unk_24F39C830;
  v21 = v22;
  v14 = v11;
  v20 = v14;
  objc_msgSend(v9, "readFromOffset:length:handler:", a4, a5, v19);

  _Block_object_dispose(v22, 8);
}

void __58__TSUIOUtils_readAllFromChannel_offset_length_completion___block_invoke(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7;
  NSObject *v8;
  void (*v9)(void);
  dispatch_data_t concat;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSObject *data2;

  data2 = a3;
  v7 = a4;
  v8 = *(NSObject **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (v8)
  {
    if (v7)
    {
      v9 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
LABEL_8:
      v9();
      v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v14 = *(void **)(v13 + 40);
      *(_QWORD *)(v13 + 40) = 0;

      goto LABEL_9;
    }
    if (data2)
    {
      concat = dispatch_data_create_concat(v8, data2);
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v12 = *(void **)(v11 + 40);
      *(_QWORD *)(v11 + 40) = concat;

    }
    if (a2)
    {
      v9 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
      goto LABEL_8;
    }
  }
LABEL_9:

}

+ (CGDataProvider)newCGDataProviderForInputStream:(id)a3
{
  id v3;
  CGDataProvider *Sequential;

  if (!a3)
    return 0;
  v3 = a3;
  CFRetain(v3);
  Sequential = CGDataProviderCreateSequential(v3, &TSUIOUtilsCGDataProviderCallbacks);

  return Sequential;
}

+ (CGDataProvider)newCGDataProviderForReadChannel:(id)a3
{
  id v4;
  TSUReadChannelInputStreamAdapter *v5;
  CGDataProvider *v6;
  void *v7;
  void *v8;

  if (!a3)
    return 0;
  v4 = a3;
  v5 = -[TSUReadChannelInputStreamAdapter initWithReadChannel:]([TSUReadChannelInputStreamAdapter alloc], "initWithReadChannel:", v4);

  if (-[TSUReadChannelInputStreamAdapter canSeek](v5, "canSeek"))
  {
    v6 = (CGDataProvider *)objc_msgSend(a1, "newCGDataProviderForInputStream:", v5);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSUIOUtils newCGDataProviderForReadChannel:]");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUIOUtils.m");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 117, 0, "Need a seekable input stream for CGDataProvider");

    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
    v6 = 0;
  }

  return v6;
}

@end
