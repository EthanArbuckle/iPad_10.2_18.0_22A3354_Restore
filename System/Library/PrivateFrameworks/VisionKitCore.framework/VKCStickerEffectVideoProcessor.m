@implementation VKCStickerEffectVideoProcessor

+ (void)applyEffect:(id)a3 toImageSequence:(id)a4 progressHandler:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, id, _QWORD);
  id v14;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, id, _QWORD))a6;
  v14 = 0;
  objc_msgSend(a1, "_transcodeSequenceData:effect:maxDimension:outputData:progressHandler:", v11, v10, 50000, &v14, v12);
  v13[2](v13, v14, 0);

}

+ (int)_transcodeSequenceData:(id)a3 effect:(id)a4 maxDimension:(unint64_t)a5 outputData:(id *)a6 progressHandler:(id)a7
{
  id v10;
  id v11;
  id v12;
  int Container;
  uint64_t v14;
  void *v15;
  void *v17;
  id v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  CFTypeRef cf;
  CFDictionaryRef theDict;
  uint64_t v24;
  uint64_t v25;
  const void *v26;
  const void *v27;
  const void *v28;
  const void *v29;
  _QWORD v30[2];
  _QWORD v31[4];

  v31[2] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a7;
  v29 = 0;
  Container = CMPhotoDecompressionSessionCreate();
  if (Container)
  {
    fprintf((FILE *)*MEMORY[0x1E0C80C10], "%s[%d]: Error %d\n", "/Library/Caches/com.apple.xbs/Sources/VisionKit/VisionKitCore/Stickers/VKCStickerEffectVideoProcessor.mm", 82, Container);
  }
  else
  {
    v28 = 0;
    Container = CMPhotoDecompressionSessionCreateContainer();
    if (Container)
    {
      fprintf((FILE *)*MEMORY[0x1E0C80C10], "%s[%d]: Error %d\n", "/Library/Caches/com.apple.xbs/Sources/VisionKit/VisionKitCore/Stickers/VKCStickerEffectVideoProcessor.mm", 89, Container);
    }
    else
    {
      v27 = 0;
      Container = CMPhotoDecompressionContainerCreateSequenceContainer();
      if (Container)
      {
        fprintf((FILE *)*MEMORY[0x1E0C80C10], "%s[%d]: Error %d\n", "/Library/Caches/com.apple.xbs/Sources/VisionKit/VisionKitCore/Stickers/VKCStickerEffectVideoProcessor.mm", 95, Container);
      }
      else
      {
        v26 = 0;
        Container = CMPhotoCompressionSessionCreate();
        if (Container)
        {
          fprintf((FILE *)*MEMORY[0x1E0C80C10], "%s[%d]: Error %d\n", "/Library/Caches/com.apple.xbs/Sources/VisionKit/VisionKitCore/Stickers/VKCStickerEffectVideoProcessor.mm", 102, Container);
        }
        else
        {
          v14 = *MEMORY[0x1E0D09308];
          v30[0] = *MEMORY[0x1E0D09318];
          v30[1] = v14;
          v31[0] = &unk_1E9494D48;
          v31[1] = &unk_1E9494D60;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 2);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          Container = CMPhotoCompressionSessionOpenEmptyContainer();
          if (Container)
          {
            fprintf((FILE *)*MEMORY[0x1E0C80C10], "%s[%d]: Error %d\n", "/Library/Caches/com.apple.xbs/Sources/VisionKit/VisionKitCore/Stickers/VKCStickerEffectVideoProcessor.mm", 109, Container);
          }
          else
          {
            v25 = 0;
            Container = CMPhotoCompressionSessionStartImageSequence();
            if (Container)
            {
              fprintf((FILE *)*MEMORY[0x1E0C80C10], "%s[%d]: Error %d\n", "/Library/Caches/com.apple.xbs/Sources/VisionKit/VisionKitCore/Stickers/VKCStickerEffectVideoProcessor.mm", 112, Container);
            }
            else
            {
              v24 = 0;
              Container = CMPhotoDecompressionContainerGetImageCountWithOptions();
              if (Container)
              {
                fprintf((FILE *)*MEMORY[0x1E0C80C10], "%s[%d]: Error %d\n", "/Library/Caches/com.apple.xbs/Sources/VisionKit/VisionKitCore/Stickers/VKCStickerEffectVideoProcessor.mm", 115, Container);
              }
              else
              {
                theDict = 0;
                Container = CMPhotoDecompressionContainerCreateDictionaryDescription();
                if (Container)
                {
                  fprintf((FILE *)*MEMORY[0x1E0C80C10], "%s[%d]: Error %d\n", "/Library/Caches/com.apple.xbs/Sources/VisionKit/VisionKitCore/Stickers/VKCStickerEffectVideoProcessor.mm", 118, Container);
                }
                else
                {
                  CFDictionaryGetValue(theDict, (const void *)*MEMORY[0x1E0D09518]);
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v19)
                  {
                    Container = CMPhotoCompressionSessionEndImageSequence();
                    if (Container)
                    {
                      fprintf((FILE *)*MEMORY[0x1E0C80C10], "%s[%d]: Error %d\n", "/Library/Caches/com.apple.xbs/Sources/VisionKit/VisionKitCore/Stickers/VKCStickerEffectVideoProcessor.mm", 204, Container);
                    }
                    else
                    {
                      cf = 0;
                      Container = CMPhotoCompressionSessionCloseContainerAndCopyBacking();
                      if (Container)
                      {
                        fprintf((FILE *)*MEMORY[0x1E0C80C10], "%s[%d]: Error %d\n", "/Library/Caches/com.apple.xbs/Sources/VisionKit/VisionKitCore/Stickers/VKCStickerEffectVideoProcessor.mm", 209, Container);
                      }
                      else
                      {
                        if (v12 && v24 >= 1)
                        {
                          v20[0] = MEMORY[0x1E0C809B0];
                          v20[1] = 3221225472;
                          v20[2] = __104__VKCStickerEffectVideoProcessor__transcodeSequenceData_effect_maxDimension_outputData_progressHandler___block_invoke_2;
                          v20[3] = &unk_1E94626D0;
                          v21 = v12;
                          vk_dispatchMainAfterDelay(v20, 0.0);

                        }
                        v17 = (void *)cf;
                        if (cf)
                          v17 = (void *)CFRetain(cf);
                        v18 = *a6;
                        *a6 = v17;

                      }
                      CF<__CFData const*>::~CF(&cf);
                    }
                  }
                  else
                  {
                    Container = -18;
                    fprintf((FILE *)*MEMORY[0x1E0C80C10], "%s[%d]: Error %d\n", "/Library/Caches/com.apple.xbs/Sources/VisionKit/VisionKitCore/Stickers/VKCStickerEffectVideoProcessor.mm", 121, -18);
                  }

                }
                CF<__CFDictionary const*>::~CF((const void **)&theDict);
              }
            }
          }

        }
        CF<CMPhotoCompressionSession *>::~CF(&v26);
      }
      CF<CMPhotoDecompressionContainer *>::~CF(&v27);
    }
    CF<CMPhotoDecompressionContainer *>::~CF(&v28);
  }
  CF<CMPhotoDecompressionSession *>::~CF(&v29);

  return Container;
}

void __104__VKCStickerEffectVideoProcessor__transcodeSequenceData_effect_maxDimension_outputData_progressHandler___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

uint64_t __104__VKCStickerEffectVideoProcessor__transcodeSequenceData_effect_maxDimension_outputData_progressHandler___block_invoke_36(_QWORD *a1)
{
  uint64_t result;

  result = a1[4];
  if (result)
    return (*(uint64_t (**)(double))(result + 16))((double)(uint64_t)a1[5] / (double)(a1[6] - 1));
  return result;
}

uint64_t __104__VKCStickerEffectVideoProcessor__transcodeSequenceData_effect_maxDimension_outputData_progressHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(double))(result + 16))(1.0);
  return result;
}

@end
