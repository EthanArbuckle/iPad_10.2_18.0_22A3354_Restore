@implementation SPRScriptInfo

- (SPRScriptInfo)initWithScriptID:(unint64_t)a3 scriptName:(id)a4 apduCount:(unsigned int)a5
{
  id v9;
  SPRScriptInfo *v10;
  SPRScriptInfo *v11;
  objc_super v13;

  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SPRScriptInfo;
  v10 = -[SPRScriptInfo init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_scriptID = a3;
    objc_storeStrong((id *)&v10->_scriptName, a4);
    v11->_apduCount = a5;
  }

  return v11;
}

- (unint64_t)scriptID
{
  return self->_scriptID;
}

- (NSString)scriptName
{
  return self->_scriptName;
}

- (unsigned)apduCount
{
  return self->_apduCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scriptName, 0);
}

@end
