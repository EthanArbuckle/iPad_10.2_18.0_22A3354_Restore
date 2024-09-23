@implementation STUKVOBackedValueBeacon

- (void)dealloc
{
  objc_super v3;

  -[NSObject removeObserver:forKeyPath:context:](self->_object, "removeObserver:forKeyPath:context:", self, self->_keyPath, CFSTR("STUKVOBackedValueBeaconObservationContext"));
  v3.receiver = self;
  v3.super_class = (Class)STUKVOBackedValueBeacon;
  -[STUKVOBackedValueBeacon dealloc](&v3, "dealloc");
}

- (STUKVOBackedValueBeacon)initWithObject:(id)a3 keyPath:(id)a4
{
  id v7;
  id v8;
  STUKVOBackedValueBeacon *v9;
  STUKVOBackedValueBeacon *v10;
  NSString *v11;
  NSString *keyPath;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)STUKVOBackedValueBeacon;
  v9 = -[STUValueBeacon init](&v14, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_object, a3);
    v11 = (NSString *)objc_msgSend(v8, "copy");
    keyPath = v10->_keyPath;
    v10->_keyPath = v11;

    -[NSObject addObserver:forKeyPath:options:context:](v10->_object, "addObserver:forKeyPath:options:context:", v10, v10->_keyPath, 4, CFSTR("STUKVOBackedValueBeaconObservationContext"));
  }

  return v10;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  void *v7;
  objc_super v8;
  objc_super v9;

  if (a6 == CFSTR("STUKVOBackedValueBeaconObservationContext"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "valueForKeyPath:", a3));
    v8.receiver = self;
    v8.super_class = (Class)STUKVOBackedValueBeacon;
    -[STUValueBeacon send:](&v8, "send:", v7);

  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)STUKVOBackedValueBeacon;
    -[STUKVOBackedValueBeacon observeValueForKeyPath:ofObject:change:context:](&v9, "observeValueForKeyPath:ofObject:change:context:", a3, a4, a5);
  }
}

- (void)send:(id)a3
{
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler", a3));
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUValueBeacon.m"), 99, CFSTR("Can't mutate a KVO value beacon."));

}

- (NSObject)object
{
  return self->_object;
}

- (NSString)keyPath
{
  return self->_keyPath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyPath, 0);
  objc_storeStrong((id *)&self->_object, 0);
}

@end
