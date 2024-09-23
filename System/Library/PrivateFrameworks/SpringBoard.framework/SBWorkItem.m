@implementation SBWorkItem

- (SBWorkItem)initWithWork:(id)a3
{
  id v4;
  SBWorkItem *v5;
  uint64_t v6;
  NSDate *creationDate;
  uint64_t v8;
  id workBlock;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBWorkItem;
  v5 = -[SBWorkItem init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v6 = objc_claimAutoreleasedReturnValue();
    creationDate = v5->_creationDate;
    v5->_creationDate = (NSDate *)v6;

    v8 = objc_msgSend(v4, "copy");
    workBlock = v5->_workBlock;
    v5->_workBlock = (id)v8;

  }
  return v5;
}

- (id)work
{
  return self->_workBlock;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong(&self->_workBlock, 0);
}

@end
