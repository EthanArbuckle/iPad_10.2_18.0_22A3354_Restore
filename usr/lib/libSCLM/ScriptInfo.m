@implementation ScriptInfo

- (ScriptInfo)initWithScriptID:(unint64_t)a3 scriptName:(id)a4 apduCount:(unsigned int)a5 scriptType:(unsigned int)a6
{
  id v11;
  ScriptInfo *v12;
  ScriptInfo *v13;
  objc_super v15;

  v11 = a4;
  v15.receiver = self;
  v15.super_class = (Class)ScriptInfo;
  v12 = -[ScriptInfo init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_scriptID = a3;
    objc_storeStrong((id *)&v12->_scriptName, a4);
    v13->_apduCount = a5;
    v13->_scriptType = a6;
  }

  return v13;
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

- (unsigned)scriptType
{
  return self->_scriptType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scriptName, 0);
}

@end
