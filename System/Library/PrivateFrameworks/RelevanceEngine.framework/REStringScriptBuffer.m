@implementation REStringScriptBuffer

- (REStringScriptBuffer)initWithString:(id)a3
{
  id v4;
  REStringScriptBuffer *v5;
  uint64_t v6;
  NSString *string;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REStringScriptBuffer;
  v5 = -[REStringScriptBuffer init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    string = v5->_string;
    v5->_string = (NSString *)v6;

    v5->_index = 0;
  }

  return v5;
}

- (BOOL)isEmpty
{
  unint64_t index;

  index = self->_index;
  return index >= -[NSString length](self->_string, "length");
}

- (unsigned)current
{
  unint64_t index;

  index = self->_index;
  if (index >= -[NSString length](self->_string, "length"))
    return 0;
  else
    return -[NSString characterAtIndex:](self->_string, "characterAtIndex:", self->_index);
}

- (void)next
{
  unint64_t index;

  index = self->_index;
  if (index < -[NSString length](self->_string, "length"))
    ++self->_index;
}

- (id)contentForLine:(unint64_t)a3
{
  NSString *string;
  void *v5;
  void *v6;
  void *v7;

  string = self->_string;
  objc_msgSend(MEMORY[0x24BDD14A8], "newlineCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSString componentsSeparatedByCharactersInSet:](string, "componentsSeparatedByCharactersInSet:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "count") <= a3)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(v6, "objectAtIndexedSubscript:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_string, 0);
}

@end
