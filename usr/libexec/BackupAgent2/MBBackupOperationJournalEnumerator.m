@implementation MBBackupOperationJournalEnumerator

- (MBBackupOperationJournalEnumerator)initWithFile:(id)a3 domainManager:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  double v11;
  MBBackupOperationJournalEnumerator *v12;
  MBBackupOperationJournalEnumerator *v13;
  id v15;
  id v16;
  const __CFString *v17;
  uint64_t v18;
  objc_super v19;
  id v20;

  v6 = a3;
  v7 = a4;
  v20 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfFile:options:error:](NSData, "dataWithContentsOfFile:options:error:", v6, 1, &v20));
  v9 = v20;
  if (!v8)
  {
    v15 = objc_msgSend(objc_alloc((Class)MBException), "initWithCode:format:", 100, CFSTR("Error memory mapping backup operation journal: %@"), v9);
    goto LABEL_11;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MBDecoder decoderWithData:](MBDecoder, "decoderWithData:", v8));
  if (objc_msgSend(v10, "decodeInt32") != 1835166318)
  {
    v16 = objc_alloc((Class)MBException);
    v17 = CFSTR("Incorrect backup operation journal magic number");
LABEL_10:
    v15 = objc_msgSend(v16, "initWithCode:format:", 11, v17, v18);
LABEL_11:
    objc_exception_throw(v15);
  }
  objc_msgSend(v10, "decodeVersion");
  if (v11 != 2.0)
  {
    v16 = objc_alloc((Class)MBException);
    v17 = CFSTR("Incorrect backup operation journal version");
    goto LABEL_10;
  }
  v19.receiver = self;
  v19.super_class = (Class)MBBackupOperationJournalEnumerator;
  v12 = -[MBBackupOperationJournalEnumerator init](&v19, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_decoder, v10);
    objc_storeStrong((id *)&v13->_domainManager, a4);
  }

  return v13;
}

- (id)nextObject
{
  unint64_t v3;
  void *v4;
  id v5;
  MBBackupOperation *v6;

  v3 = -[MBDecoder offset](self->_decoder, "offset");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MBDecoder data](self->_decoder, "data"));
  v5 = objc_msgSend(v4, "length");

  if (v3 >= (unint64_t)v5)
    v6 = 0;
  else
    v6 = -[MBBackupOperation initWithDecoder:domainManager:]([MBBackupOperation alloc], "initWithDecoder:domainManager:", self->_decoder, self->_domainManager);
  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domainManager, 0);
  objc_storeStrong((id *)&self->_decoder, 0);
}

@end
