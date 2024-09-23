@implementation HVQueueBookmark

- (void)reset
{
  BMBookmark *pastBookmark;
  NSNumber *futureCutoff;
  BMBookmark *futureBookmark;

  self->_los = 0;
  pastBookmark = self->_pastBookmark;
  self->_pastBookmark = 0;

  futureCutoff = self->_futureCutoff;
  self->_futureCutoff = 0;

  futureBookmark = self->_futureBookmark;
  self->_futureBookmark = 0;

}

- (id)jsonDict
{
  void *v3;
  void *v4;
  void *v5;
  NSNumber *futureCutoff;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  _QWORD v13[5];

  v13[4] = *MEMORY[0x24BDAC8D0];
  v12[0] = CFSTR("los");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", self->_los);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v3;
  v12[1] = CFSTR("pastBookmark");
  -[BMBookmark debugDescription](self->_pastBookmark, "debugDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13[1] = v5;
  v12[2] = CFSTR("futureCutoff");
  futureCutoff = self->_futureCutoff;
  v7 = futureCutoff;
  if (!futureCutoff)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13[2] = v7;
  v12[3] = CFSTR("futureBookmark");
  -[BMBookmark debugDescription](self->_futureBookmark, "debugDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13[3] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)

  if (!futureCutoff)
  {

    if (v4)
      goto LABEL_11;
LABEL_13:

    goto LABEL_11;
  }
  if (!v4)
    goto LABEL_13;
LABEL_11:

  return v10;
}

- (unsigned)los
{
  return self->_los;
}

- (void)setLos:(unsigned __int8)a3
{
  self->_los = a3;
}

- (BMBookmark)pastBookmark
{
  return self->_pastBookmark;
}

- (void)setPastBookmark:(id)a3
{
  objc_storeStrong((id *)&self->_pastBookmark, a3);
}

- (NSNumber)futureCutoff
{
  return self->_futureCutoff;
}

- (void)setFutureCutoff:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BMBookmark)futureBookmark
{
  return self->_futureBookmark;
}

- (void)setFutureBookmark:(id)a3
{
  objc_storeStrong((id *)&self->_futureBookmark, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_futureBookmark, 0);
  objc_storeStrong((id *)&self->_futureCutoff, 0);
  objc_storeStrong((id *)&self->_pastBookmark, 0);
}

@end
