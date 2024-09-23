@implementation PVFaceCropGenerator

+ (id)generateFaceCropsFromSourceDescriptors:(id)a3 withProgressBlock:(id)a4 failureBlock:(id)a5 canceler:(id)a6
{
  id v9;
  void (**v10)(id, void *, uint64_t, _QWORD);
  void (**v11)(id, id, uint64_t, _QWORD, id);
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  PVFaceCrop *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  id v30;
  double x;
  double y;
  double width;
  double height;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  PVFaceCrop *v40;
  PVFaceCrop *v41;
  id v42;
  id v43;
  void (**v44)(id, id, uint64_t, _QWORD, id);
  uint64_t v45;
  unint64_t v46;
  unint64_t v47;
  unint64_t v48;
  void *v49;
  void *v50;
  id v51;
  id v53;
  void *v54;
  void (**v55)(id, void *, uint64_t, _QWORD);
  void (**v56)(id, id, uint64_t, _QWORD, id);
  id obj;
  id v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  id v63;
  id v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _QWORD v69[4];
  id v70;
  void (**v71)(id, id, uint64_t, _QWORD, id);
  unint64_t v72;
  _BYTE v73[128];
  uint64_t v74;
  CGRect v75;

  v74 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = (void (**)(id, void *, uint64_t, _QWORD))a4;
  v11 = (void (**)(id, id, uint64_t, _QWORD, id))a5;
  v63 = a6;
  v12 = objc_msgSend(v9, "count");
  if (v12)
  {
    v59 = v12;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
    v58 = (id)objc_claimAutoreleasedReturnValue();
    v65 = 0u;
    v66 = 0u;
    v67 = 0u;
    v68 = 0u;
    v53 = v9;
    obj = v9;
    v61 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v73, 16);
    if (v61)
    {
      v62 = -1;
      v60 = *(_QWORD *)v66;
      v55 = v10;
      v56 = v11;
      while (2)
      {
        for (i = 0; i != v61; ++i)
        {
          if (*(_QWORD *)v66 != v60)
            objc_enumerationMutation(obj);
          v14 = v62 + i;
          v15 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * i);
          v16 = (void *)MEMORY[0x1D1798448]();
          if (v10)
          {
            v17 = (void *)MEMORY[0x1D1798448]();
            v10[2](v10, v15, v14 + 1, v59);
            objc_autoreleasePoolPop(v17);
          }
          v64 = 0;
          v18 = v15;
          if (objc_msgSend(v63, "canceled"))
          {
            objc_msgSend(MEMORY[0x1E0CB35C8], "errorForPhotoVisionCancelledOperation");
            v19 = 0;
            v64 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            objc_msgSend(v18, "face");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            if (v20)
            {
              objc_msgSend(v18, "image");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              if (v21)
              {
                objc_msgSend(v20, "normalizedFaceRect");
                v23 = v22;
                v25 = v24;
                v27 = v26;
                v29 = v28;
                v30 = v21;
                objc_msgSend(v30, "imageRectForNormalizedRect:", v23, v25, v27, v29);
                x = v75.origin.x;
                y = v75.origin.y;
                width = v75.size.width;
                height = v75.size.height;
                if (CGRectIsNull(v75))
                {
                  v35 = (void *)MEMORY[0x1E0CB35C8];
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{ { %f, %f }, { %f, %f} } is not a normalized rect"), *(_QWORD *)&v23, *(_QWORD *)&v25, *(_QWORD *)&v27, *(_QWORD *)&v29);
                  v36 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v35, "errorForPhotoVisionInvalidParameterWithLocalizedDescription:", v36);
                  v37 = 0;
                  v64 = (id)objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  v54 = v16;
                  objc_msgSend(v30, "groupingIdentifier");
                  v36 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v30, "imageURL");
                  v38 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v38)
                  {
                    v37 = +[PVFaceCropUtils newFaceCropFromImageURL:withFaceRect:groupingIdentifier:error:](PVFaceCropUtils, "newFaceCropFromImageURL:withFaceRect:groupingIdentifier:error:", v38, v36, &v64, x, y, width, height);
                  }
                  else
                  {
                    objc_msgSend(v30, "imageData");
                    v39 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v39)
                    {
                      v37 = +[PVFaceCropUtils newFaceCropFromImageData:withFaceRect:groupingIdentifier:error:](PVFaceCropUtils, "newFaceCropFromImageData:withFaceRect:groupingIdentifier:error:", v39, v36, &v64, x, y, width, height);
                    }
                    else
                    {
                      objc_msgSend(MEMORY[0x1E0CB35C8], "errorForPhotoVisionInvalidParameterWithLocalizedDescription:", CFSTR("The image cannot provide an URL or a data representation"));
                      v37 = 0;
                      v64 = (id)objc_claimAutoreleasedReturnValue();
                    }

                    v38 = 0;
                  }

                  v16 = v54;
                }

                if (v37)
                {
                  v40 = -[PVFaceCrop initWithFaceCropData:originatingFace:]([PVFaceCrop alloc], "initWithFaceCropData:originatingFace:", v37, v20);
                  v19 = v40;
                  if (v40)
                  {
                    v41 = v40;
                  }
                  else
                  {
                    objc_msgSend(MEMORY[0x1E0CB35C8], "errorForPhotoVisionUnexpectedCondition:", CFSTR("failed to create PVFaceCrop"));
                    v64 = (id)objc_claimAutoreleasedReturnValue();
                  }

                }
                else
                {
                  v19 = 0;
                }
              }
              else
              {
                objc_msgSend(MEMORY[0x1E0CB35C8], "errorForPhotoVisionInvalidNilParameterNamed:", CFSTR("faceCropSourceDescriptor.image"));
                v19 = 0;
                v64 = (id)objc_claimAutoreleasedReturnValue();
              }

              v10 = v55;
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0CB35C8], "errorForPhotoVisionInvalidNilParameterNamed:", CFSTR("faceCropSourceDescriptor.face"));
              v19 = 0;
              v64 = (id)objc_claimAutoreleasedReturnValue();
            }

            v11 = v56;
          }

          v42 = v64;
          if (v19)
          {
            objc_msgSend(v58, "addObject:", v19);
          }
          else
          {
            if (v11)
              v11[2](v11, v18, v14 + 1, v59, v42);
            if (objc_msgSend(v63, "canceled"))
            {
              v43 = obj;
              v44 = v11;
              if (v11)
              {
                v45 = v14 + 2;
                v46 = objc_msgSend(v43, "count");
                v47 = v46 - (v14 + 2);
                if (v46 > v14 + 2)
                {
                  v48 = v46;
                  objc_msgSend(MEMORY[0x1E0CB35C8], "errorForPhotoVisionCancelledOperation");
                  v49 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", v45, v47);
                  v50 = (void *)objc_claimAutoreleasedReturnValue();
                  v69[0] = MEMORY[0x1E0C809B0];
                  v69[1] = 3221225472;
                  v69[2] = ___reportCancellationOfRemainingFaceCropSourceDescriptors_block_invoke;
                  v69[3] = &unk_1E851FF40;
                  v71 = v44;
                  v72 = v48;
                  v70 = v49;
                  v51 = v49;
                  objc_msgSend(v43, "enumerateObjectsAtIndexes:options:usingBlock:", v50, 0, v69);

                }
              }

              objc_autoreleasePoolPop(v16);
              v10 = v55;
              v11 = v56;
              goto LABEL_45;
            }
          }

          objc_autoreleasePoolPop(v16);
        }
        v62 += i;
        v61 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v73, 16);
        if (v61)
          continue;
        break;
      }
    }
LABEL_45:

    v9 = v53;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v58 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v58;
}

@end
