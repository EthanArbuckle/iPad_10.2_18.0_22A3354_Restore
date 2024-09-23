@implementation PUReuseQueue

- (PUReuseQueue)init
{
  PUReuseQueue *v2;
  PUReuseQueue *v3;
  uint64_t v4;
  NSMutableDictionary *objectCreationBlocksByReuseIdentifier;
  uint64_t v6;
  NSMutableDictionary *reusableObjectsByReuseIdentifier;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PUReuseQueue;
  v2 = -[PUReuseQueue init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_reuseEnabled = 1;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = objc_claimAutoreleasedReturnValue();
    objectCreationBlocksByReuseIdentifier = v3->__objectCreationBlocksByReuseIdentifier;
    v3->__objectCreationBlocksByReuseIdentifier = (NSMutableDictionary *)v4;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = objc_claimAutoreleasedReturnValue();
    reusableObjectsByReuseIdentifier = v3->__reusableObjectsByReuseIdentifier;
    v3->__reusableObjectsByReuseIdentifier = (NSMutableDictionary *)v6;

  }
  return v3;
}

- (void)registerObjectCreationBlock:(id)a3 withReuseIdentifier:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v7 = a4;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUReuseQueue.m"), 30, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("objectCreationBlock != NULL"));

    if (v7)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUReuseQueue.m"), 31, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reuseIdentifier != nil"));

    goto LABEL_3;
  }
  if (!v7)
    goto LABEL_5;
LABEL_3:
  v8 = (void *)objc_msgSend(v12, "copy");
  -[PUReuseQueue _objectCreationBlocksByReuseIdentifier](self, "_objectCreationBlocksByReuseIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, v7);

}

- (id)dequeueObjectWithReuseIdentifier:(id)a3 isReused:(BOOL *)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  void *v12;
  void (**v13)(_QWORD);
  void *v15;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUReuseQueue.m"), 37, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reuseIdentifier != nil"));

  }
  -[PUReuseQueue _reusableObjectsByReuseIdentifier](self, "_reusableObjectsByReuseIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count") && -[PUReuseQueue isReuseEnabled](self, "isReuseEnabled"))
  {
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObjectAtIndex:", 0);
    v11 = 1;
    if (!a4)
      goto LABEL_12;
    goto LABEL_11;
  }
  -[PUReuseQueue _objectCreationBlocksByReuseIdentifier](self, "_objectCreationBlocksByReuseIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", v7);
  v13 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v13[2](v13);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  v11 = 0;
  if (a4)
LABEL_11:
    *a4 = v11;
LABEL_12:

  return v10;
}

- (void)enqueueObjectForReuse:(id)a3 withReuseIdentifier:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v7 = a4;
  if (v12)
  {
    if (v7)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUReuseQueue.m"), 60, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("object != nil"));

    if (v7)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUReuseQueue.m"), 61, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reuseIdentifier != nil"));

LABEL_3:
  -[PUReuseQueue _reusableObjectsByReuseIdentifier](self, "_reusableObjectsByReuseIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, v7);
  }
  objc_msgSend(v9, "addObject:", v12);

}

- (NSMutableDictionary)_objectCreationBlocksByReuseIdentifier
{
  return self->__objectCreationBlocksByReuseIdentifier;
}

- (NSMutableDictionary)_reusableObjectsByReuseIdentifier
{
  return self->__reusableObjectsByReuseIdentifier;
}

- (BOOL)isReuseEnabled
{
  return self->_reuseEnabled;
}

- (void)setReuseEnabled:(BOOL)a3
{
  self->_reuseEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__reusableObjectsByReuseIdentifier, 0);
  objc_storeStrong((id *)&self->__objectCreationBlocksByReuseIdentifier, 0);
}

@end
