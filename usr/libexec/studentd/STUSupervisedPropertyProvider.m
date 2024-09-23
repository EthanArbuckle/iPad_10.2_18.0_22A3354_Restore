@implementation STUSupervisedPropertyProvider

- (void)dealloc
{
  objc_super v3;

  -[STUSupervisedPropertyProvider endUpdating](self, "endUpdating");
  v3.receiver = self;
  v3.super_class = (Class)STUSupervisedPropertyProvider;
  -[STUSupervisedPropertyProvider dealloc](&v3, "dealloc");
}

- (STUSupervisedPropertyProvider)init
{
  STUSupervisedPropertyProvider *v2;
  STUSupervisedPropertyProvider *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STUSupervisedPropertyProvider;
  v2 = -[STUSupervisedPropertyProvider init](&v5, "init");
  v3 = v2;
  if (v2)
    -[STUDevicePropertyProvider setValue:](v2, "setValue:", &__kCFBooleanFalse);
  return v3;
}

- (id)key
{
  return CRKDeviceSupervisedKey;
}

- (void)beginUpdating
{
  id v3;

  if (!-[STUSupervisedPropertyProvider isUpdating](self, "isUpdating"))
  {
    -[STUSupervisedPropertyProvider setUpdating:](self, "setUpdating:", 1);
    v3 = (id)objc_claimAutoreleasedReturnValue(-[STUSupervisedPropertyProvider configuration](self, "configuration"));
    objc_msgSend(v3, "addObserver:forKeyPath:options:context:", self, CFSTR("supervised"), 4, CFSTR("ObservationContext"));

  }
}

- (void)endUpdating
{
  id v3;

  if (-[STUSupervisedPropertyProvider isUpdating](self, "isUpdating"))
  {
    -[STUSupervisedPropertyProvider setUpdating:](self, "setUpdating:", 0);
    v3 = (id)objc_claimAutoreleasedReturnValue(-[STUSupervisedPropertyProvider configuration](self, "configuration"));
    objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, CFSTR("supervised"), CFSTR("ObservationContext"));

  }
}

- (id)configuration
{
  return +[STUCloudConfiguration sharedConfiguration](STUCloudConfiguration, "sharedConfiguration");
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  void *v7;
  id v8;
  objc_super v9;

  if (a6 == CFSTR("ObservationContext"))
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(-[STUSupervisedPropertyProvider configuration](self, "configuration", a3, a4, a5));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v8, "isSupervised")));
    -[STUDevicePropertyProvider setValue:](self, "setValue:", v7);

  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)STUSupervisedPropertyProvider;
    -[STUSupervisedPropertyProvider observeValueForKeyPath:ofObject:change:context:](&v9, "observeValueForKeyPath:ofObject:change:context:", a3, a4, a5);
  }
}

- (BOOL)isUpdating
{
  return self->_updating;
}

- (void)setUpdating:(BOOL)a3
{
  self->_updating = a3;
}

@end
