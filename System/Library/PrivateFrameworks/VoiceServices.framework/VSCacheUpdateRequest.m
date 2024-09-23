@implementation VSCacheUpdateRequest

- (VSCacheUpdateRequest)initWithModelIdentifier:(id)a3 classIdentifier:(id)a4
{
  VSCacheUpdateRequest *v6;

  v6 = -[VSCacheUpdateRequest init](self, "init");
  if (v6)
  {
    v6->_modelID = (NSString *)a3;
    v6->_classID = (NSString *)a4;
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VSCacheUpdateRequest;
  -[VSCacheUpdateRequest dealloc](&v3, sel_dealloc);
}

- (id)modelIdentifier
{
  return self->_modelID;
}

- (id)classIdentifier
{
  return self->_classID;
}

- (id)coalescedRequest:(id)a3
{
  id v3;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = a3;
  v5 = (void *)objc_msgSend(a3, "modelIdentifier");
  v6 = objc_msgSend(v3, "classIdentifier");
  if (v5)
  {
    if (!self->_modelID)
      return self;
    v7 = (void *)v6;
    if (!objc_msgSend(v5, "isEqualToString:"))
      return 0;
    if (v7)
    {
      if (self->_classID)
      {
        if (objc_msgSend(v7, "isEqualToString:"))
          return self;
        else
          return 0;
      }
      return self;
    }
  }
  return v3;
}

- (id)description
{
  const __CFString *classID;
  const __CFString *modelID;

  classID = CFSTR("all");
  modelID = (const __CFString *)self->_modelID;
  if (!modelID)
    modelID = CFSTR("all");
  if (self->_classID)
    classID = (const __CFString *)self->_classID;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("model <%@> class <%@>"), modelID, classID);
}

@end
