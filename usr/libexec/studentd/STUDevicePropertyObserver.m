@implementation STUDevicePropertyObserver

- (void)dealloc
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  objc_super v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CRKDevice allPropertyKeys](CRKDevice, "allPropertyKeys"));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        -[STUDevice removeObserver:forKeyPath:](self->_device, "removeObserver:forKeyPath:", self, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v7));
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v8, "removeObserver:name:object:", self, CFSTR("STUUserPropertiesDidChangeNotificationName"), 0);

  v9.receiver = self;
  v9.super_class = (Class)STUDevicePropertyObserver;
  -[STUDevicePropertyObserver dealloc](&v9, "dealloc");
}

- (STUDevicePropertyObserver)initWithDevice:(id)a3
{
  id v5;
  STUDevicePropertyObserver *v6;
  STUDevicePropertyObserver *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  objc_super v19;
  _BYTE v20[128];

  v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)STUDevicePropertyObserver;
  v6 = -[STUDevicePropertyObserver init](&v19, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_device, a3);
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[CRKDevice allPropertyKeys](CRKDevice, "allPropertyKeys", 0));
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v16;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v8);
          -[STUDevice addObserver:forKeyPath:options:context:](v7->_device, "addObserver:forKeyPath:options:context:", v7, *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v12), 1, "kSTUDevicePropertyNotifierContext");
          v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
      }
      while (v10);
    }

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v13, "addObserver:selector:name:object:", v7, "studentImageDidChange:", CFSTR("STUUserPropertiesDidChangeNotificationName"), 0);

  }
  return v7;
}

- (void)studentImageDidChange:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void **v14;
  void *v15;
  void *i;
  id v17;
  void *v18;
  id v19;
  void *v20;
  unsigned int v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "userInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CourseIdentifier")));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "userInfo"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("UserIsStudent")));
  v21 = objc_msgSend(v7, "BOOLValue");

  v20 = v3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "userInfo"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("PropertiesByKey")));

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v24;
    if (v21)
      v14 = (void **)&CRKDeviceStudentImageIdentifierKey;
    else
      v14 = (void **)&CRKDeviceInstructorImageIdentifierKey;
    v15 = *v14;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v24 != v13)
          objc_enumerationMutation(v10);
        v17 = *(id *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v17));
        if (objc_msgSend(v17, "isEqualToString:", CFSTR("imageIdentifier")))
        {
          v19 = v15;

          v17 = v19;
        }
        else if (!v21)
        {
          goto LABEL_13;
        }
        -[STUDevicePropertyObserver delegateKey:didChangeToValue:inCourse:](self, "delegateKey:didChangeToValue:inCourse:", v17, v18, v5);
LABEL_13:

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v12);
  }

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  objc_super v13;

  if (a6 == "kSTUDevicePropertyNotifierContext")
  {
    v11 = a3;
    v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a5, "objectForKeyedSubscript:", NSKeyValueChangeNewKey));
    -[STUDevicePropertyObserver delegateKey:didChangeToValue:inCourse:](self, "delegateKey:didChangeToValue:inCourse:", v11, v12, 0);

  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)STUDevicePropertyObserver;
    v10 = a3;
    -[STUDevicePropertyObserver observeValueForKeyPath:ofObject:change:context:](&v13, "observeValueForKeyPath:ofObject:change:context:", v10, a4, a5, a6);

  }
}

- (void)delegateKey:(id)a3 didChangeToValue:(id)a4 inCourse:(id)a5
{
  id v8;
  id v9;
  void *v10;
  char v11;
  void *v12;
  id v13;

  v13 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[STUDevicePropertyObserver delegate](self, "delegate"));
  v11 = objc_opt_respondsToSelector(v10, "devicePropertyObserver:didObserveChangeForKey:toValue:inCourse:");

  if ((v11 & 1) != 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[STUDevicePropertyObserver delegate](self, "delegate"));
    objc_msgSend(v12, "devicePropertyObserver:didObserveChangeForKey:toValue:inCourse:", self, v13, v8, v9);

  }
}

- (STUDevice)device
{
  return self->_device;
}

- (STUDevicePropertyObserverDelegate)delegate
{
  return (STUDevicePropertyObserverDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_device, 0);
}

@end
