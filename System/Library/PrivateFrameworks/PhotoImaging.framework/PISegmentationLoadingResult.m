@implementation PISegmentationLoadingResult

- (PISegmentationLoadingResult)initWithObject:(id)a3 success:(BOOL)a4 error:(id)a5
{
  id v9;
  id v10;
  PISegmentationLoadingResult *v11;
  PISegmentationLoadingResult *v12;
  objc_super v14;

  v9 = a3;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)PISegmentationLoadingResult;
  v11 = -[PISegmentationLoadingResult init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong(&v11->_object, a3);
    v12->_success = a4;
    objc_storeStrong((id *)&v12->_error, a5);
  }

  return v12;
}

- (id)object
{
  return self->_object;
}

- (BOOL)success
{
  return self->_success;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong(&self->_object, 0);
}

@end
