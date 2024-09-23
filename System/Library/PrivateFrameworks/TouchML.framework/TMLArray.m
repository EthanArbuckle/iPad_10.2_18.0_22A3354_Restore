@implementation TMLArray

+ (id)keyPathsForValuesAffectingValueForKey:(id)a3
{
  double v3;
  const char *v4;
  double v5;
  id v6;

  if (objc_msgSend_isEqualToString_(a3, a2, v3, CFSTR("array")))
  {
    objc_msgSend_set(MEMORY[0x24BDBCF20], v4, v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (qword_255B51B30 != -1)
      dispatch_once(&qword_255B51B30, &unk_24F4FE738);
    v6 = (id)qword_255B51B28;
  }
  return v6;
}

- (TMLArray)initWithArray:(id)a3
{
  id v4;
  const char *v5;
  double v6;
  const char *v7;
  TMLArray *v8;
  double v9;
  const char *v10;
  double v11;

  v4 = a3;
  v8 = (TMLArray *)objc_msgSend_init(self, v5, v6);
  if (v8 && objc_msgSend_count(v4, v7, v9))
    objc_msgSend_addObjectsFromArray_(v8->_array, v10, v11, v4);

  return v8;
}

- (TMLArray)init
{
  TMLArray *v2;
  NSMutableArray *v3;
  NSMutableArray *array;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TMLArray;
  v2 = -[TMLArray init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    array = v2->_array;
    v2->_array = v3;

  }
  return v2;
}

- (void)setArray:(id)a3
{
  ((void (*)(NSMutableArray *, char *))MEMORY[0x24BEDD108])(self->_array, sel_setArray_);
}

- (unint64_t)count
{
  double v2;

  return objc_msgSend_count(self->_array, a2, v2);
}

- (id)get:(unint64_t)a3
{
  double v3;
  const char *v6;
  double v7;
  void *v8;

  if (objc_msgSend_count(self->_array, a2, v3) <= a3)
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend_objectAtIndexedSubscript_(self->_array, v6, v7, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v8;
}

- (void)set:(unint64_t)a3 value:(id)a4
{
  id v6;
  const char *v7;
  double v8;
  const char *v9;
  double v10;
  const char *v11;
  double v12;
  const char *v13;
  double v14;
  const char *v15;
  double v16;
  void *v17;
  const char *v18;
  double v19;
  void *v20;
  const char *v21;
  double v22;
  const char *v23;
  double v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  if (objc_msgSend_count(self->_array, v7, v8) <= a3)
  {
    if (objc_msgSend_count(self->_array, v9, v10) == a3)
      objc_msgSend_append_(self, v23, v24, v6);
  }
  else
  {
    objc_msgSend_willChangeValueForKey_(self, v9, v10, CFSTR("array"));
    objc_msgSend_replaceObjectAtIndex_withObject_(self->_array, v11, v12, a3, v6);
    objc_msgSend_didChangeValueForKey_(self, v13, v14, CFSTR("array"));
    objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x24BDD16E0], v15, v16, a3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v17;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v18, v19, v25, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_emitTMLSignal_withArguments_(self, v21, v22, CFSTR("modified"), v20);

  }
}

- (void)append:(id)a3
{
  id v4;
  const char *v5;
  double v6;
  const char *v7;
  double v8;
  const char *v9;
  double v10;
  void *v11;
  const char *v12;
  double v13;
  uint64_t v14;
  const char *v15;
  double v16;
  void *v17;
  const char *v18;
  double v19;
  void *v20;
  const char *v21;
  double v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend_willChangeValueForKey_(self, v5, v6, CFSTR("array"));
  objc_msgSend_addObject_(self->_array, v7, v8, v4);

  objc_msgSend_didChangeValueForKey_(self, v9, v10, CFSTR("array"));
  v11 = (void *)MEMORY[0x24BDD16E0];
  v14 = objc_msgSend_count(self->_array, v12, v13);
  objc_msgSend_numberWithUnsignedInteger_(v11, v15, v16, v14 - 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v17;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v18, v19, v23, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_emitTMLSignal_withArguments_(self, v21, v22, CFSTR("modified"), v20);

}

- (void)remove:(unint64_t)a3
{
  double v3;
  const char *v6;
  double v7;
  const char *v8;
  double v9;
  const char *v10;
  double v11;

  if (objc_msgSend_count(self->_array, a2, v3) > a3)
  {
    objc_msgSend_willChangeValueForKey_(self, v6, v7, CFSTR("array"));
    objc_msgSend_removeObjectAtIndex_(self->_array, v8, v9, a3);
    objc_msgSend_didChangeValueForKey_(self, v10, v11, CFSTR("array"));
  }
}

- (void)removeAllObjects
{
  double v2;
  const char *v4;
  double v5;
  const char *v6;
  double v7;

  objc_msgSend_willChangeValueForKey_(self, a2, v2, CFSTR("array"));
  objc_msgSend_removeAllObjects(self->_array, v4, v5);
  objc_msgSend_didChangeValueForKey_(self, v6, v7, CFSTR("array"));
}

- (NSArray)array
{
  return &self->_array->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_array, 0);
}

@end
