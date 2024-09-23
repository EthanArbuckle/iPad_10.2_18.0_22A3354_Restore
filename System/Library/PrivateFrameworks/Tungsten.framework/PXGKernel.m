@implementation PXGKernel

+ ($F99D9A4FB75BC57F3386B8DC8EE08D7A)groupSizeForImageSize:(SEL)a3 pipelineState:(id *)a4
{
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t var1;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A *result;
  id v21;

  v21 = a5;
  v7 = objc_msgSend(v21, "threadExecutionWidth");
  v8 = objc_msgSend(v21, "maxTotalThreadsPerThreadgroup");
  v9 = v8 / v7;
  retstr->var0 = v7;
  retstr->var1 = v8 / v7;
  retstr->var2 = 1;
  if (v7 <= v8)
  {
    v10 = 0;
    var1 = a4->var1;
    v12 = v7 + a4->var0;
    v13 = -1;
    v14 = -(uint64_t)(var1 * a4->var0);
    v15 = -1;
    do
    {
      if (v7 + v10 <= v9)
        v16 = v9;
      else
        v16 = v7 + v10;
      if (v7 + v10 >= v9)
        v17 = v9;
      else
        v17 = v7 + v10;
      if (v14 + (var1 + v9 - 1) / v9 * v9 * (v12 + v10 - 1) / (v7 + v10) * (v7 + v10) <= v13)
      {
        v18 = v16 / v17;
        if (v18 <= v15)
        {
          retstr->var0 = v7 + v10;
          retstr->var1 = v9;
          v15 = v18;
          v13 = v14 + (var1 + v9 - 1) / v9 * v9 * (v12 + v10 - 1) / (v7 + v10) * (v7 + v10);
          retstr->var2 = 1;
        }
      }
      v19 = 2 * v7 + v10;
      v10 += v7;
      v9 = v8 / v19;
    }
    while (v7 + v10 <= v8);
  }

  return result;
}

+ ($F99D9A4FB75BC57F3386B8DC8EE08D7A)gridSizeForThreadGroupSize:(SEL)a3 imageSize:(id *)a4
{
  unint64_t v5;

  v5 = (a5->var1 + a4->var1 - 1) / a4->var1;
  retstr->var0 = (a5->var0 + a4->var0 - 1) / a4->var0;
  retstr->var1 = v5;
  retstr->var2 = 1;
  return result;
}

+ (id)pipelineStateForFunctionWithName:(id)a3 constants:(id)a4 key:(id)a5 device:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  id v24;
  id v25;
  id v26;
  id v27;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a1;
  objc_sync_enter(v15);
  objc_getAssociatedObject(v14, a2);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    v16 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    objc_setAssociatedObject(v14, a2, v16, (void *)0x301);
  }
  objc_msgSend(v16, "objectForKey:", v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v17)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0;
    v19 = (void *)objc_msgSend(v14, "newDefaultLibraryWithBundle:error:", v18, &v27);
    v20 = v27;

    if (v19)
    {
      v26 = v20;
      v24 = v12;
      v21 = (void *)objc_msgSend(v19, "newFunctionWithName:constantValues:error:", v11, v12, &v26);
      v22 = v26;

      if (v21)
      {
        v25 = v22;
        v17 = (void *)objc_msgSend(v14, "newComputePipelineStateWithFunction:error:", v21, &v25);
        v20 = v25;

        if (v17)
        {
          objc_msgSend(v16, "setObject:forKey:", v17, v13);
        }
        else
        {
          NSLog(CFSTR("*** could not load Metal library: %@"), v20);
          v17 = 0;
        }
      }
      else
      {
        NSLog(CFSTR("*** could not load Metal kernel function '%@', error: %@"), v11, v22);
        v17 = 0;
        v20 = v22;
      }

      v12 = v24;
    }
    else
    {
      NSLog(CFSTR("*** could not load Metal library: %@"), v20);
      v17 = 0;
    }

  }
  objc_sync_exit(v15);

  return v17;
}

- (void)encodeToCommandBuffer:(id)a3 sourceTexture:(id)a4 destinationTexture:(id)a5 targetScale:(double)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  objc_class *v14;
  void *v15;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (objc_class *)objc_opt_class();
  NSStringFromClass(v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGKernel.m"), 91, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXGKernel encodeToCommandBuffer:sourceTexture:destinationTexture:targetScale:]", v15);

  abort();
}

@end
