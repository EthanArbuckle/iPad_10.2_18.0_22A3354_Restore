@implementation SRCompactViewControllerContentTesterState

- (SRCompactViewControllerContentTesterState)initWithDeviceIsPad:(BOOL)a3 navigationStackIsPopping:(BOOL)a4 navigationStackSize:(int64_t)a5 navigationBarHasContent:(BOOL)a6 multiLevelViewHasContent:(BOOL)a7 editableUtteranceViewHasContent:(BOOL)a8 compactViewHasContent:(BOOL)a9 siriViewControllerIsEditing:(BOOL)a10 keyboardHasContent:(BOOL)a11 contextMenuIsPresented:(BOOL)a12
{
  SRCompactViewControllerContentTesterState *result;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)SRCompactViewControllerContentTesterState;
  result = -[SRCompactViewControllerContentTesterState init](&v19, sel_init);
  if (result)
  {
    result->_deviceIsPad = a3;
    result->_navigationStackIsPopping = a4;
    result->_navigationStackSize = a5;
    result->_navigationBarHasContent = a6;
    result->_multiLevelViewHasContent = a7;
    result->_editableUtteranceViewHasContent = a8;
    result->_compactViewHasContent = a9;
    result->_siriViewControllerIsEditing = a10;
    result->_keyboardHasContent = a11;
    result->_contextMenuIsPresented = a12;
  }
  return result;
}

- (id)_debugDescriptionForProperty:(id)a3 formattedValue:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@=%@"), a3, a4);
}

- (id)_debugDescriptionForProperty:(id)a3 BOOLValue:(BOOL)a4
{
  const __CFString *v4;

  if (a4)
    v4 = CFSTR("YES");
  else
    v4 = CFSTR("NO");
  return -[SRCompactViewControllerContentTesterState _debugDescriptionForProperty:formattedValue:](self, "_debugDescriptionForProperty:formattedValue:", a3, v4);
}

- (id)_debugDescriptionForProperty:(id)a3 integerValue:(int64_t)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v6 = (void *)MEMORY[0x24BDD17C8];
  v7 = a3;
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%zd"), a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SRCompactViewControllerContentTesterState _debugDescriptionForProperty:formattedValue:](self, "_debugDescriptionForProperty:formattedValue:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _QWORD v29[12];

  v29[10] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:", CFSTR("<"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v4);

  -[SRCompactViewControllerContentTesterState _debugDescriptionForProperty:BOOLValue:](self, "_debugDescriptionForProperty:BOOLValue:", CFSTR("deviceIsPad"), -[SRCompactViewControllerContentTesterState deviceIsPad](self, "deviceIsPad"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v23;
  -[SRCompactViewControllerContentTesterState _debugDescriptionForProperty:BOOLValue:](self, "_debugDescriptionForProperty:BOOLValue:", CFSTR("navigationStackIsPopping"), -[SRCompactViewControllerContentTesterState deviceIsPad](self, "deviceIsPad"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v22;
  -[SRCompactViewControllerContentTesterState _debugDescriptionForProperty:integerValue:](self, "_debugDescriptionForProperty:integerValue:", CFSTR("navigationStackSize"), -[SRCompactViewControllerContentTesterState navigationStackSize](self, "navigationStackSize"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v29[2] = v5;
  -[SRCompactViewControllerContentTesterState _debugDescriptionForProperty:BOOLValue:](self, "_debugDescriptionForProperty:BOOLValue:", CFSTR("navigationBarHasContent"), -[SRCompactViewControllerContentTesterState navigationBarHasContent](self, "navigationBarHasContent"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v29[3] = v6;
  -[SRCompactViewControllerContentTesterState _debugDescriptionForProperty:BOOLValue:](self, "_debugDescriptionForProperty:BOOLValue:", CFSTR("multiLevelViewHasContent"), -[SRCompactViewControllerContentTesterState multiLevelViewHasContent](self, "multiLevelViewHasContent"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v29[4] = v7;
  -[SRCompactViewControllerContentTesterState _debugDescriptionForProperty:BOOLValue:](self, "_debugDescriptionForProperty:BOOLValue:", CFSTR("editableUtteranceViewHasContent"), -[SRCompactViewControllerContentTesterState editableUtteranceViewHasContent](self, "editableUtteranceViewHasContent"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v29[5] = v8;
  -[SRCompactViewControllerContentTesterState _debugDescriptionForProperty:BOOLValue:](self, "_debugDescriptionForProperty:BOOLValue:", CFSTR("compactViewHasContent"), -[SRCompactViewControllerContentTesterState compactViewHasContent](self, "compactViewHasContent"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v29[6] = v9;
  -[SRCompactViewControllerContentTesterState _debugDescriptionForProperty:BOOLValue:](self, "_debugDescriptionForProperty:BOOLValue:", CFSTR("siriViewControllerIsEditing"), -[SRCompactViewControllerContentTesterState siriViewControllerIsEditing](self, "siriViewControllerIsEditing"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v29[7] = v10;
  -[SRCompactViewControllerContentTesterState _debugDescriptionForProperty:BOOLValue:](self, "_debugDescriptionForProperty:BOOLValue:", CFSTR("keyboardHasContent"), -[SRCompactViewControllerContentTesterState keyboardHasContent](self, "keyboardHasContent"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v29[8] = v11;
  -[SRCompactViewControllerContentTesterState _debugDescriptionForProperty:BOOLValue:](self, "_debugDescriptionForProperty:BOOLValue:", CFSTR("contextMenuIsPresented"), -[SRCompactViewControllerContentTesterState contextMenuIsPresented](self, "contextMenuIsPresented"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v29[9] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v29, 10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v14 = v13;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v25;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v25 != v17)
          objc_enumerationMutation(v14);
        v19 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v18);
        objc_msgSend(v3, "appendString:", CFSTR("\n\t"));
        objc_msgSend(v3, "appendString:", v19);
        ++v18;
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v16);
  }

  objc_msgSend(v3, "appendString:", CFSTR("\n>"));
  v20 = (void *)objc_msgSend(v3, "mutableCopy");

  return v20;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _BOOL8 v4;
  _BOOL8 v5;
  int64_t v6;
  _BOOL8 v7;
  _BOOL8 v8;
  _BOOL8 v9;
  BOOL v10;
  BOOL v11;
  BOOL v12;
  uint64_t v14;
  SRCompactViewControllerContentTesterState *v15;

  v15 = [SRCompactViewControllerContentTesterState alloc];
  v4 = -[SRCompactViewControllerContentTesterState deviceIsPad](self, "deviceIsPad");
  v5 = -[SRCompactViewControllerContentTesterState navigationStackIsPopping](self, "navigationStackIsPopping");
  v6 = -[SRCompactViewControllerContentTesterState navigationStackSize](self, "navigationStackSize");
  v7 = -[SRCompactViewControllerContentTesterState navigationBarHasContent](self, "navigationBarHasContent");
  v8 = -[SRCompactViewControllerContentTesterState multiLevelViewHasContent](self, "multiLevelViewHasContent");
  v9 = -[SRCompactViewControllerContentTesterState editableUtteranceViewHasContent](self, "editableUtteranceViewHasContent");
  v10 = -[SRCompactViewControllerContentTesterState compactViewHasContent](self, "compactViewHasContent");
  v11 = -[SRCompactViewControllerContentTesterState siriViewControllerIsEditing](self, "siriViewControllerIsEditing");
  v12 = -[SRCompactViewControllerContentTesterState keyboardHasContent](self, "keyboardHasContent");
  BYTE3(v14) = -[SRCompactViewControllerContentTesterState contextMenuIsPresented](self, "contextMenuIsPresented");
  BYTE2(v14) = v12;
  BYTE1(v14) = v11;
  LOBYTE(v14) = v10;
  return -[SRCompactViewControllerContentTesterState initWithDeviceIsPad:navigationStackIsPopping:navigationStackSize:navigationBarHasContent:multiLevelViewHasContent:editableUtteranceViewHasContent:compactViewHasContent:siriViewControllerIsEditing:keyboardHasContent:contextMenuIsPresented:](v15, "initWithDeviceIsPad:navigationStackIsPopping:navigationStackSize:navigationBarHasContent:multiLevelViewHasContent:editableUtteranceViewHasContent:compactViewHasContent:siriViewControllerIsEditing:keyboardHasContent:contextMenuIsPresented:", v4, v5, v6, v7, v8, v9, v14);
}

- (BOOL)deviceIsPad
{
  return self->_deviceIsPad;
}

- (BOOL)navigationStackIsPopping
{
  return self->_navigationStackIsPopping;
}

- (int64_t)navigationStackSize
{
  return self->_navigationStackSize;
}

- (BOOL)navigationBarHasContent
{
  return self->_navigationBarHasContent;
}

- (BOOL)multiLevelViewHasContent
{
  return self->_multiLevelViewHasContent;
}

- (BOOL)editableUtteranceViewHasContent
{
  return self->_editableUtteranceViewHasContent;
}

- (BOOL)compactViewHasContent
{
  return self->_compactViewHasContent;
}

- (BOOL)siriViewControllerIsEditing
{
  return self->_siriViewControllerIsEditing;
}

- (BOOL)keyboardHasContent
{
  return self->_keyboardHasContent;
}

- (BOOL)contextMenuIsPresented
{
  return self->_contextMenuIsPresented;
}

@end
