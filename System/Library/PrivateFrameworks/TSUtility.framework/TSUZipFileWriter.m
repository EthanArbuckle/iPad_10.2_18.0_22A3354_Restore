@implementation TSUZipFileWriter

- (TSUZipFileWriter)initWithURL:(id)a3
{
  id v4;
  TSUZipFileWriter *v5;
  TSURandomWriteChannel *v6;
  TSURandomWriteChannel *writeChannel;
  TSURandomWriteChannel *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TSUZipFileWriter;
  v5 = -[TSUZipWriter init](&v10, sel_init);
  if (v5)
  {
    v6 = -[TSUFileIOChannel initForRandomWritingURL:]([TSUFileIOChannel alloc], "initForRandomWritingURL:", v4);
    writeChannel = v5->_writeChannel;
    v5->_writeChannel = v6;

    v8 = v5->_writeChannel;
    if (v8)
    {
      -[TSURandomWriteChannel setLowWater:](v8, "setLowWater:", -1);
    }
    else
    {

      v5 = 0;
    }
  }

  return v5;
}

+ (void)zipDirectoryAtURL:(id)a3 toURL:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  int v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  void *v42;
  id v43;
  void *v44;
  id v45;
  void *v46;
  uint64_t v47;
  TSUZipFileWriter *v48;
  id obj;
  _QWORD v50[4];
  id v51;
  _QWORD *v52;
  _QWORD v53[5];
  id v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _QWORD v59[3];
  char v60;
  _BYTE v61[128];
  _QWORD v62[3];

  v62[1] = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v45 = a5;
  v43 = a6;
  v44 = v10;
  v46 = v9;
  if (v9)
  {
    if (v10)
      goto LABEL_6;
  }
  else
  {
    +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSUZipFileWriter zipDirectoryAtURL:toURL:queue:completion:]");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUZipFileWriter.m");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, v13, 45, CFSTR("invalid nil value for '%s'"), "directoryURL");

    v10 = v44;
    if (v44)
      goto LABEL_6;
  }
  +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSUZipFileWriter zipDirectoryAtURL:toURL:queue:completion:]");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUZipFileWriter.m");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, v16, 46, CFSTR("invalid nil value for '%s'"), "URL");

  v10 = v44;
LABEL_6:
  if (!v45)
  {
    +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSUZipFileWriter zipDirectoryAtURL:toURL:queue:completion:]");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUZipFileWriter.m");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, v19, 47, CFSTR("invalid nil value for '%s'"), "queue");

    v10 = v44;
  }
  if (!v43)
  {
    +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSUZipFileWriter zipDirectoryAtURL:toURL:queue:completion:]");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUZipFileWriter.m");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", v21, v22, 48, CFSTR("invalid nil value for '%s'"), "completion");

    v10 = v44;
  }
  v48 = -[TSUZipFileWriter initWithURL:]([TSUZipFileWriter alloc], "initWithURL:", v10);
  objc_msgSend(v9, "path");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "stringByDeletingLastPathComponent");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "stringByStandardizingPath");
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = objc_msgSend(v42, "length");
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = *MEMORY[0x24BDBCC60];
  v62[0] = *MEMORY[0x24BDBCC60];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v62, 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v46, v28, 0, 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  v59[0] = 0;
  v59[1] = v59;
  v59[2] = 0x2020000000;
  v60 = 1;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  obj = v29;
  v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v61, 16);
  if (v30)
  {
    v47 = v25 + 1;
    v31 = *(_QWORD *)v56;
    do
    {
      for (i = 0; i != v30; ++i)
      {
        if (*(_QWORD *)v56 != v31)
          objc_enumerationMutation(obj);
        v33 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
        v54 = 0;
        v34 = objc_msgSend(v33, "getResourceValue:forKey:error:", &v54, v27, 0);
        v35 = v54;
        v36 = v35;
        if (v34)
        {
          if ((objc_msgSend(v35, "BOOLValue") & 1) != 0)
            goto LABEL_20;
          objc_msgSend(v33, "path");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "stringByStandardizingPath");
          v38 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v38, "substringFromIndex:", v47);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = -[TSUFileIOChannel initForReadingURL:]([TSUFileIOChannel alloc], "initForReadingURL:", v33);
          v53[0] = MEMORY[0x24BDAC760];
          v53[1] = 3221225472;
          v53[2] = __61__TSUZipFileWriter_zipDirectoryAtURL_toURL_queue_completion___block_invoke;
          v53[3] = &unk_24D61B7C0;
          v53[4] = v59;
          -[TSUZipWriter writeEntryWithName:fromReadChannel:completion:](v48, "writeEntryWithName:fromReadChannel:completion:", v39, v40, v53);
        }
        else
        {
          +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSUZipFileWriter zipDirectoryAtURL:toURL:queue:completion:]");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUZipFileWriter.m");
          v40 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "handleFailureInFunction:file:lineNumber:description:", v39, v40, 80, CFSTR("Failed to obtain resource value for %@"), v33);
        }

LABEL_20:
      }
      v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v61, 16);
    }
    while (v30);
  }

  v50[0] = MEMORY[0x24BDAC760];
  v50[1] = 3221225472;
  v50[2] = __61__TSUZipFileWriter_zipDirectoryAtURL_toURL_queue_completion___block_invoke_2;
  v50[3] = &unk_24D61B7E8;
  v41 = v43;
  v51 = v41;
  v52 = v59;
  -[TSUZipWriter closeWithQueue:completion:](v48, "closeWithQueue:completion:", v45, v50);

  _Block_object_dispose(v59, 8);
}

uint64_t __61__TSUZipFileWriter_zipDirectoryAtURL_toURL_queue_completion___block_invoke(uint64_t result, char a2)
{
  if ((a2 & 1) == 0)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 0;
  return result;
}

uint64_t __61__TSUZipFileWriter_zipDirectoryAtURL_toURL_queue_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  uint64_t v4;

  if (a2)
    v3 = 1;
  else
    v3 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) == 0;
  v4 = !v3;
  return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), v4, a2);
}

- (id)writeChannel
{
  return self->_writeChannel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_writeChannel, 0);
}

@end
