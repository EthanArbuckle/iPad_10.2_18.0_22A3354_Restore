@implementation NURenderPipelineHelper

id __112__NURenderPipelineHelper_PI__portraitVideo_disparityInput_disparityKeyframes_apertureKeyframes_debugMode_error___block_invoke(void *a1)
{
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  PIScalarKeyframe *v9;
  PIScalarKeyframe *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if (objc_msgSend(v1, "count"))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v1, "count"));
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v3 = v1;
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v13;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v13 != v6)
            objc_enumerationMutation(v3);
          v8 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v7);
          v9 = [PIScalarKeyframe alloc];
          v10 = -[PIScalarKeyframe initWithDictionaryRepresentation:](v9, "initWithDictionaryRepresentation:", v8, (_QWORD)v12);
          objc_msgSend(v2, "addObject:", v10);

          ++v7;
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v5);
    }

  }
  else
  {
    v2 = 0;
  }

  return v2;
}

@end
