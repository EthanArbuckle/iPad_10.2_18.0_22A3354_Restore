@implementation CRMLModel

- (id)decodeActivations:(void *)a3
{
  NSLog(CFSTR("decodeActivations must be overridden in subclass"), a2, a3);
  -[CRMLModel doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (id)decodeActivations:(void *)a3 blank:(unsigned __int16)a4 ctcAllowGarbage:(BOOL)a5 numResultNeeded:(int64_t)a6
{
  NSLog(CFSTR("decodeActivations must be overridden in subclass"), a2, a3, a4, a5, a6);
  -[CRMLModel doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (vector<std::vector<std::vector<float>>,)activationsFromImage:(CRMLModel *)self
{
  id v6;
  uint64_t v7;
  vector<std::vector<std::vector<float>>, std::allocator<std::vector<std::vector<float>>>> *result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  unsigned __int8 *v23;
  uint64_t v24;
  uint64_t modelWidth;
  uint64_t v26;
  unsigned __int8 *v27;
  double *v28;
  unsigned __int8 *v29;
  uint64_t v30;
  unsigned int v31;
  void *v32;
  void *v33;
  void *v34;
  _BOOL4 v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  _BOOL4 v42;
  uint64_t i;
  int v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  float v48;
  uint64_t v49;
  float *v50;
  uint64_t v51;
  float *v52;
  unint64_t v53;
  float *v54;
  void **v55;
  float *v56;
  uint64_t v57;
  unint64_t v58;
  uint64_t v59;
  unint64_t v60;
  char *v61;
  float *v62;
  int v63;
  id v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  id v68;
  id v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  id v74;
  void *v75;
  id v76;
  void *v77;
  uint64_t v78;
  uint64_t **v79;
  id v80;
  __int128 v81;
  __int128 v82;
  _QWORD v83[7];

  v83[5] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  retstr->var1 = 0;
  retstr->var2.var0 = 0;
  retstr->var0 = 0;
  v79 = (uint64_t **)retstr;
  v69 = v6;
  if (objc_msgSend(v6, "width") >= (unint64_t)self->_modelWidth
    && objc_msgSend(v69, "height") == self->_modelHeight)
  {
    std::vector<std::vector<std::vector<float>>>::resize((uint64_t *)retstr, 1uLL);
    if ((unint64_t)(objc_msgSend(v69, "width") - self->_modelWidth + 1) >= 2)
      v7 = (unint64_t)(objc_msgSend(v69, "width") - self->_modelWidth + 1) >> 1;
    else
      v7 = 1;
    v9 = -[CRMLModel gpuBatchSize](self, "gpuBatchSize");
    std::vector<std::vector<float>>::resize(*v79, v7);
    v66 = vcvtps_s32_f32((float)v7 / (float)v9);
    if (v66 >= 1)
    {
      v67 = v7;
      v71 = 0;
      v72 = v9;
      v10 = 0;
      v77 = 0;
      v65 = 2 * v9;
      do
      {
        v11 = v72;
        v70 = v10;
        if (v66 - 1 == v10)
        {
          v11 = v72;
          if (v67 != v72)
            v11 = v67 % v72;
        }
        v78 = v11;
        v12 = objc_alloc(MEMORY[0x1E0C9E970]);
        v83[0] = &unk_1E9926868;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v72);
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        v83[1] = v75;
        -[CRMLModel modelShape](self, "modelShape");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "objectAtIndexedSubscript:", 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v83[2] = v13;
        -[CRMLModel modelShape](self, "modelShape");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectAtIndexedSubscript:", 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v83[3] = v15;
        -[CRMLModel modelShape](self, "modelShape");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectAtIndexedSubscript:", 2);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v83[4] = v17;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v83, 5);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v68 = (id)objc_msgSend(v12, "initWithShape:dataType:error:", v18, 65600, 0);

        v81 = 0u;
        v82 = 0u;
        if (v69)
          objc_msgSend(v69, "vImage");
        v76 = objc_retainAutorelease(v68);
        v19 = objc_msgSend(v76, "dataPointer");
        if (v78 >= 1)
        {
          v20 = 0;
          v21 = 0;
          v22 = *((_QWORD *)&v81 + 1);
          v23 = (unsigned __int8 *)(v81 + v71);
          do
          {
            if (v22)
            {
              v24 = 0;
              modelWidth = self->_modelWidth;
              v26 = *((_QWORD *)&v82 + 1);
              v27 = v23;
              do
              {
                if ((int)modelWidth >= 1)
                {
                  v28 = (double *)(v19 + 8 * v21);
                  v21 += modelWidth;
                  v29 = v27;
                  v30 = modelWidth;
                  do
                  {
                    v31 = *v29++;
                    *v28++ = (float)((float)v31 / 255.0);
                    --v30;
                  }
                  while (v30);
                }
                ++v24;
                v27 += v26;
              }
              while (v24 != v22);
            }
            v20 += 2;
            v23 += 2;
          }
          while (2 * v78 > v20);
        }
        v80 = v77;
        -[CRMLModel predict:error:](self, "predict:error:", v76, &v80);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v74 = v80;

        if (v74)
          NSLog(CFSTR("%@"), v74);
        objc_msgSend(v32, "shape");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "objectAtIndexedSubscript:", 0);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = objc_msgSend(v34, "integerValue") < v78;

        if (v35)
        {
          objc_msgSend(v32, "shape");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "objectAtIndexedSubscript:", 0);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          NSLog(CFSTR("CoreRecognition: result %@ size %@ is smaller than batch size %li"), v32, v37, v72);

        }
        objc_msgSend(v32, "shape");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "shape");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "objectAtIndexedSubscript:", objc_msgSend(v39, "count") - 1);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = objc_msgSend(v40, "integerValue");
        v42 = v41 == -[CRMLModel classCount](self, "classCount");

        if (!v42)
        {
          objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Codemap size doesn't match model output class"), 0);
          v64 = (id)objc_claimAutoreleasedReturnValue();
          objc_exception_throw(v64);
        }
        if (v78 >= 1)
        {
          for (i = 0; i != v78; ++i)
          {
            v44 = 0;
            v45 = i + v70 * v72;
            while (v44 < -[CRMLModel classCount](self, "classCount"))
            {
              v46 = **v79;
              v47 = objc_msgSend(objc_retainAutorelease(v32), "dataPointer");
              v48 = *(double *)(v47 + 8 * (int)(v44 + -[CRMLModel classCount](self, "classCount") * i));
              v49 = v46 + 24 * v45;
              v52 = *(float **)(v49 + 8);
              v51 = v49 + 8;
              v50 = v52;
              v53 = *(_QWORD *)(v51 + 8);
              if ((unint64_t)v52 >= v53)
              {
                v55 = (void **)(v46 + 24 * v45);
                v56 = (float *)*v55;
                v57 = ((char *)v50 - (_BYTE *)*v55) >> 2;
                v58 = v57 + 1;
                if ((unint64_t)(v57 + 1) >> 62)
                  std::vector<int>::__throw_length_error[abi:ne180100]();
                v59 = v53 - (_QWORD)v56;
                if (v59 >> 1 > v58)
                  v58 = v59 >> 1;
                if ((unint64_t)v59 >= 0x7FFFFFFFFFFFFFFCLL)
                  v60 = 0x3FFFFFFFFFFFFFFFLL;
                else
                  v60 = v58;
                if (v60)
                {
                  v61 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>(v51 + 8, v60);
                  v50 = *(float **)v51;
                  v56 = (float *)*v55;
                }
                else
                {
                  v61 = 0;
                }
                v62 = (float *)&v61[4 * v57];
                *v62 = v48;
                v54 = v62 + 1;
                while (v50 != v56)
                {
                  v63 = *((_DWORD *)v50-- - 1);
                  *((_DWORD *)v62-- - 1) = v63;
                }
                *v55 = v62;
                *(_QWORD *)v51 = v54;
                *(_QWORD *)(v51 + 8) = &v61[4 * v60];
                if (v56)
                  operator delete(v56);
              }
              else
              {
                *v50 = v48;
                v54 = v50 + 1;
              }
              *(_QWORD *)v51 = v54;
              ++v44;
            }
          }
        }

        v10 = v70 + 1;
        v71 += v65;
        v77 = v74;
      }
      while (v70 + 1 != v66);

    }
  }
  else
  {
    NSLog(CFSTR("Attempt to recognize image (%zu,%zu) incompatible with model input dimensions (%i,%i)"), objc_msgSend(v69, "width"), objc_msgSend(v69, "height"), self->_modelWidth, self->_modelHeight);
  }

  return result;
}

- (CRMLModel)init
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  CRMLModel *v7;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRMLModel modelName](self, "modelName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pathForResource:ofType:", v4, CFSTR("bundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CRMLModel initWithURL:error:](self, "initWithURL:error:", v6, 0);

  return v7;
}

- (id)initRestrictingToCPU:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  CRMLModel *v9;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRMLModel modelName](self, "modelName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pathForResource:ofType:", v6, CFSTR("bundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[CRMLModel initWithURL:restrictToCPU:error:](self, "initWithURL:restrictToCPU:error:", v8, v3, 0);

  return v9;
}

- (CRMLModel)initWithURL:(id)a3 error:(id *)a4
{
  return -[CRMLModel initWithURL:restrictToCPU:error:](self, "initWithURL:restrictToCPU:error:", a3, 0, a4);
}

- (CRMLModel)initWithURL:(id)a3 restrictToCPU:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v6;
  id v8;
  CRMLModel *v9;
  void *v10;
  uint64_t v11;
  MLModel *model;
  MLModel *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  CRMLModel *v29;
  objc_super v31;

  v6 = a4;
  v8 = a3;
  v31.receiver = self;
  v31.super_class = (Class)CRMLModel;
  v9 = -[CRMLModel init](&v31, sel_init);
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0C9E958], "defaultConfiguration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((deviceHasAppleNeuralEngine() & 1) == 0)
      objc_msgSend(v10, "setAllowBackgroundGPUCompute:", 1);
    if (v6)
      objc_msgSend(v10, "setComputeUnits:", 0);
    objc_msgSend(MEMORY[0x1E0C9E940], "modelWithContentsOfURL:configuration:error:", v8, v10, a5);
    v11 = objc_claimAutoreleasedReturnValue();
    model = v9->model;
    v9->model = (MLModel *)v11;

    if (a5 && *a5 || (v13 = v9->model) == 0)
    {

      v29 = 0;
      goto LABEL_16;
    }
    -[MLModel modelDescription](v13, "modelDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "inputDescriptionsByName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("data"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "multiArrayConstraint");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "shape");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRMLModel setModelShape:](v9, "setModelShape:", v18);

    -[CRMLModel modelShape](v9, "modelShape");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectAtIndexedSubscript:", 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_modelHeight = objc_msgSend(v20, "intValue");

    -[CRMLModel modelShape](v9, "modelShape");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectAtIndexedSubscript:", 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_modelWidth = objc_msgSend(v22, "intValue");

    -[CRMLModel setGpuBatchSize:](v9, "setGpuBatchSize:", 256);
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectForKey:", CFSTR("com.apple.CoreRecognition.gpu_batch_size"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "integerValue");

    if (v25 >= 1)
    {
      -[CRMLModel setGpuBatchSize:](v9, "setGpuBatchSize:", v25);
      NSLog(CFSTR("Using custom gpu batch size of %li"), -[CRMLModel gpuBatchSize](v9, "gpuBatchSize"));
    }
    -[CRMLModel setCpuBatchSize:](v9, "setCpuBatchSize:", 512);
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "objectForKey:", CFSTR("com.apple.CoreRecognition.cpu_batch_size"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "integerValue");

    if (v28 >= 1)
    {
      -[CRMLModel setCpuBatchSize:](v9, "setCpuBatchSize:", v28);
      NSLog(CFSTR("Using custom cpu batch size of %li"), -[CRMLModel cpuBatchSize](v9, "cpuBatchSize"));
    }

  }
  v29 = v9;
LABEL_16:

  return v29;
}

- (int)inputWidth
{
  return self->_modelWidth;
}

- (int)inputHeight
{
  return self->_modelHeight;
}

- (NSString)modelName
{
  NSLog(CFSTR("modelName must be overridden in subclass"));
  -[CRMLModel doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return (NSString *)&stru_1E98DC948;
}

- (id)predict:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  void *v8;
  CRMLModel *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a3;
  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, CFSTR("data"));
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9E8F8]), "initWithDictionary:error:", v7, a4);
  v9 = self;
  objc_sync_enter(v9);
  -[MLModel predictionFromFeatures:error:](v9->model, "predictionFromFeatures:error:", v8, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v9);

  objc_msgSend(v10, "featureValueForName:", CFSTR("softmax_output"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "multiArrayValue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (const)codeMap
{
  return self->_codeMap;
}

- (int)classCount
{
  return self->_classCount;
}

- (NSArray)modelShape
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setModelShape:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (int64_t)gpuBatchSize
{
  return self->_gpuBatchSize;
}

- (void)setGpuBatchSize:(int64_t)a3
{
  self->_gpuBatchSize = a3;
}

- (int64_t)cpuBatchSize
{
  return self->_cpuBatchSize;
}

- (void)setCpuBatchSize:(int64_t)a3
{
  self->_cpuBatchSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelShape, 0);
  objc_storeStrong((id *)&self->model, 0);
}

@end
