@implementation TMLDictionary

+ (id)keyPathsForValuesAffectingValueForKey:(id)a3
{
  double v3;
  const char *v4;
  double v5;
  id v6;

  if (objc_msgSend_isEqualToString_(a3, a2, v3, CFSTR("dictionary")))
  {
    objc_msgSend_set(MEMORY[0x24BDBCF20], v4, v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (qword_255B51D30 != -1)
      dispatch_once(&qword_255B51D30, &unk_24F503FD8);
    v6 = (id)qword_255B51D28;
  }
  return v6;
}

- (TMLDictionary)initWithDictionary:(id)a3
{
  id v4;
  const char *v5;
  double v6;
  const char *v7;
  TMLDictionary *v8;
  double v9;
  const char *v10;
  double v11;

  v4 = a3;
  v8 = (TMLDictionary *)objc_msgSend_init(self, v5, v6);
  if (v8 && objc_msgSend_count(v4, v7, v9))
    objc_msgSend_setDictionary_(v8->_dictionary, v10, v11, v4);

  return v8;
}

- (TMLDictionary)init
{
  TMLDictionary *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *dictionary;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TMLDictionary;
  v2 = -[TMLDictionary init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    dictionary = v2->_dictionary;
    v2->_dictionary = v3;

  }
  return v2;
}

- (void)setDictionary:(id)a3
{
  double v3;

  objc_msgSend_setDictionary_(self->_dictionary, a2, v3, a3);
}

- (unint64_t)count
{
  double v2;

  return objc_msgSend_count(self->_dictionary, a2, v2);
}

- (NSArray)keys
{
  double v2;

  return (NSArray *)objc_msgSend_allKeys(self->_dictionary, a2, v2);
}

- (id)get:(id)a3
{
  double v3;

  return (id)objc_msgSend_objectForKeyedSubscript_(self->_dictionary, a2, v3, a3);
}

- (void)set:(id)a3 value:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  double v9;
  id v10;
  const char *v11;
  double v12;
  void *v13;
  const char *v14;
  double v15;
  const char *v16;
  double v17;
  const char *v18;
  double v19;
  const char *v20;
  double v21;
  void *v22;
  const char *v23;
  double v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend_objectForKeyedSubscript_(self->_dictionary, v8, v9, v6);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v13 = v10;
  if (v10 != v7 && (objc_msgSend_isEqual_(v10, v11, v12, v7) & 1) == 0)
  {
    objc_msgSend_willChangeValueForKey_(self, v14, v15, CFSTR("dictionary"));
    objc_msgSend_setObject_forKeyedSubscript_(self->_dictionary, v16, v17, v7, v6);
    objc_msgSend_didChangeValueForKey_(self, v18, v19, CFSTR("dictionary"));
    v25[0] = v6;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v20, v21, v25, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_emitTMLSignal_withArguments_(self, v23, v24, CFSTR("modified"), v22);

  }
}

- (id)union:(id)a3
{
  NSMutableDictionary *dictionary;
  id v4;
  const char *v5;
  double v6;
  void *v7;
  const char *v8;
  double v9;

  dictionary = self->_dictionary;
  v4 = a3;
  v7 = (void *)objc_msgSend_mutableCopy(dictionary, v5, v6);
  objc_msgSend_addEntriesFromDictionary_(v7, v8, v9, v4);

  return v7;
}

- (void)removeObjectForKey:(id)a3
{
  id v4;
  const char *v5;
  double v6;
  const char *v7;
  double v8;
  const char *v9;
  double v10;
  const char *v11;
  double v12;
  void *v13;
  const char *v14;
  double v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend_willChangeValueForKey_(self, v5, v6, CFSTR("dictionary"));
  objc_msgSend_removeObjectForKey_(self->_dictionary, v7, v8, v4);
  objc_msgSend_didChangeValueForKey_(self, v9, v10, CFSTR("dictionary"));
  v16[0] = v4;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v11, v12, v16, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_emitTMLSignal_withArguments_(self, v14, v15, CFSTR("modified"), v13);
}

- (void)removeAllObjects
{
  double v2;
  const char *v4;
  double v5;
  const char *v6;
  double v7;
  const char *v8;
  double v9;

  objc_msgSend_willChangeValueForKey_(self, a2, v2, CFSTR("dictionary"));
  objc_msgSend_removeAllObjects(self->_dictionary, v4, v5);
  objc_msgSend_didChangeValueForKey_(self, v6, v7, CFSTR("dictionary"));
  objc_msgSend_emitTMLSignal_withArguments_(self, v8, v9, CFSTR("modified"), 0);
}

- (NSDictionary)dictionary
{
  return &self->_dictionary->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionary, 0);
}

@end
