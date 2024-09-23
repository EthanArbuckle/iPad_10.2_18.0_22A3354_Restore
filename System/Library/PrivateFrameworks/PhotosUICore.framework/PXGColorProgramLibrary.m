@implementation PXGColorProgramLibrary

- (PXGColorProgramLibrary)initWithContext:(id)a3 destinationColorSpace:(CGColorSpace *)a4
{
  id v8;
  PXGColorProgramLibrary *v9;
  void *v10;
  NSMutableArray *v11;
  NSMutableArray *programs;
  NSMutableSet *v13;
  NSMutableSet *failedColorspaces;
  void *v16;
  void *v17;
  objc_super v18;

  v8 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PXGColorProgramLibrary;
  v9 = -[PXGColorProgramLibrary init](&v18, sel_init);
  if (v9)
  {
    objc_msgSend(v8, "device");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      if (a4)
      {
LABEL_4:
        objc_storeStrong((id *)&v9->_metalRenderContext, a3);
        v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
        programs = v9->_programs;
        v9->_programs = v11;

        v13 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
        failedColorspaces = v9->_failedColorspaces;
        v9->_failedColorspaces = v13;

        v9->_destinationColorSpace = CGColorSpaceRetain(a4);
        v9->_lock._os_unfair_lock_opaque = 0;
        goto LABEL_5;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, v9, CFSTR("PXGColorProgram.m"), 685, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("context.device != nil"));

      if (a4)
        goto LABEL_4;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, v9, CFSTR("PXGColorProgram.m"), 686, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("destinationColorSpace != nil"));

    goto LABEL_4;
  }
LABEL_5:

  return v9;
}

- (PXGColorProgramLibrary)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGColorProgram.m"), 697, CFSTR("%s is not available as initializer"), "-[PXGColorProgramLibrary init]");

  abort();
}

- (void)dealloc
{
  objc_super v3;

  CGColorSpaceRelease(self->_destinationColorSpace);
  v3.receiver = self;
  v3.super_class = (Class)PXGColorProgramLibrary;
  -[PXGColorProgramLibrary dealloc](&v3, sel_dealloc);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  objc_super v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB37A0];
  v16.receiver = self;
  v16.super_class = (Class)PXGColorProgramLibrary;
  -[PXGColorProgramLibrary description](&v16, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ programs:\n"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = self->_programs;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(v5, "appendFormat:", CFSTR("%@\n\n"), *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10++));
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    }
    while (v8);
  }

  objc_msgSend(v5, "appendString:", CFSTR(">"));
  return v5;
}

- (id)colorProgramForSourceColorSpace:(CGColorSpace *)a3 flags:(unint64_t)a4
{
  os_unfair_lock_s *p_lock;
  uint64_t v8;
  PXGColorProgram *v9;
  NSMutableArray *programs;
  PXGColorProgram *v11;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (CGColorSpaceGetModel(a3) == kCGColorSpaceModelCMYK)
    a3 = (CGColorSpace *)PXGGetReconciledColorSpace();
  if (!-[NSMutableArray count](self->_programs, "count"))
    goto LABEL_8;
  v8 = 0;
  while (1)
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_programs, "objectAtIndexedSubscript:", v8);
    v9 = (PXGColorProgram *)objc_claimAutoreleasedReturnValue();
    if (-[PXGColorProgram flags](v9, "flags") == a4)
    {
      if (MEMORY[0x1A85CCE38](-[PXGColorProgram sourceColorSpace](v9, "sourceColorSpace"), a3))
        break;
    }

    if (++v8 >= (unint64_t)-[NSMutableArray count](self->_programs, "count"))
      goto LABEL_8;
  }
  if (v8)
  {
    programs = self->_programs;
    v11 = v9;
    -[NSMutableArray removeObjectAtIndex:](programs, "removeObjectAtIndex:", v8);
    -[NSMutableArray insertObject:atIndex:](self->_programs, "insertObject:atIndex:", v11, 0);

  }
  if (!v9)
  {
LABEL_8:
    if ((-[NSMutableSet containsObject:](self->_failedColorspaces, "containsObject:", a3) & 1) != 0)
    {
      v9 = 0;
    }
    else
    {
      v9 = -[PXGColorProgram initWithContext:sourceColorSpace:destinationColorSpace:flags:]([PXGColorProgram alloc], "initWithContext:sourceColorSpace:destinationColorSpace:flags:", self->_metalRenderContext, a3, -[PXGColorProgramLibrary destinationColorSpace](self, "destinationColorSpace"), a4);
      if (v9)
        -[NSMutableArray insertObject:atIndex:](self->_programs, "insertObject:atIndex:", v9, 0);
      else
        -[NSMutableSet addObject:](self->_failedColorspaces, "addObject:", a3);
    }
  }
  os_unfair_lock_unlock(p_lock);
  return v9;
}

- (PXGMetalRenderContext)metalRenderContext
{
  return self->_metalRenderContext;
}

- (CGColorSpace)destinationColorSpace
{
  return self->_destinationColorSpace;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metalRenderContext, 0);
  objc_storeStrong((id *)&self->_failedColorspaces, 0);
  objc_storeStrong((id *)&self->_programs, 0);
}

@end
