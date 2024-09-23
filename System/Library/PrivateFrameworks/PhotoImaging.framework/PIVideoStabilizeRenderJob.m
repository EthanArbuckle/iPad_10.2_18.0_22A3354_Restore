@implementation PIVideoStabilizeRenderJob

- (BOOL)wantsRenderStage
{
  return 0;
}

- (BOOL)wantsCompleteStage
{
  return 0;
}

- (BOOL)wantsOutputVideo
{
  return 1;
}

- (id)scalePolicy
{
  return (id)objc_msgSend(MEMORY[0x1E0D520E0], "oneToOneScalePolicy");
}

- (BOOL)prepare:(id *)a3
{
  _PIVideoStabilizeFlowControl *v3;
  char v4;
  PIVideoReframeMetadataExtractor *v5;
  void *v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  double v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  unint64_t v32;
  BOOL v33;
  void *v34;
  void *v35;
  float v36;
  float v37;
  double v38;
  double v39;
  void *v40;
  _PIVideoStabilizeFlowControl *v41;
  double v42;
  void *v43;
  double v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  NSArray *v51;
  NSArray *keyframes;
  void *v53;
  void *v54;
  void *v56;
  void *v57;
  NSObject *v58;
  void *v59;
  const void **v60;
  void *specific;
  NSObject *v62;
  _BOOL4 v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  id v68;
  void *v69;
  void *v70;
  CFDictionaryRef DictionaryRepresentation;
  id v72;
  id v73;
  id v74;
  _PIVideoStabilizeFlowControl *v75;
  void *v76;
  void *v78;
  id obj;
  uint64_t v81;
  void *v82;
  uint64_t v83;
  CFDictionaryRef v84;
  uint64_t i;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  _QWORD v89[4];
  id v90;
  id location[5];
  objc_super v92;
  CMTime v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  unsigned int v98;
  CMTime time;
  _QWORD v100[4];
  _QWORD v101[4];
  _QWORD v102[2];
  _QWORD v103[2];
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  _BYTE buf[120];
  uint64_t v114;
  CGSize v115;

  v114 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    NUAssertLogger_5182();
    v58 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != nil");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v59;
      _os_log_error_impl(&dword_1A6382000, v58, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v60 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_5182();
    v62 = objc_claimAutoreleasedReturnValue();
    v63 = os_log_type_enabled(v62, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v63)
      {
        v66 = dispatch_get_specific(*v60);
        v67 = (void *)MEMORY[0x1E0CB3978];
        v68 = v66;
        objc_msgSend(v67, "callStackSymbols");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "componentsJoinedByString:", CFSTR("\n"));
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v66;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v70;
        _os_log_error_impl(&dword_1A6382000, v62, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v63)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "componentsJoinedByString:", CFSTR("\n"));
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v65;
      _os_log_error_impl(&dword_1A6382000, v62, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
    __break(1u);
  }
  v92.receiver = self;
  v92.super_class = (Class)PIVideoStabilizeRenderJob;
  if (-[NURenderJob prepare:](&v92, sel_prepare_))
  {
    -[NURenderJob outputVideo](self, "outputVideo");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D52348], "firstEnabledVideoTrackInAsset:error:", v78, a3);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v76)
    {
      v33 = 0;
LABEL_34:

      return v33;
    }
    objc_msgSend(MEMORY[0x1E0D52348], "cleanApertureOfTrack:oriented:", v76, 0);
    v72 = location[4];
    v73 = location[3];
    v3 = objc_alloc_init(_PIVideoStabilizeFlowControl);
    -[_PIVideoStabilizeFlowControl setProgressHandler:](v3, "setProgressHandler:", self->_progressHandler);
    objc_initWeak(location, self);
    v89[0] = MEMORY[0x1E0C809B0];
    v89[1] = 3221225472;
    v89[2] = __37__PIVideoStabilizeRenderJob_prepare___block_invoke;
    v89[3] = &unk_1E5016238;
    objc_copyWeak(&v90, location);
    -[_PIVideoStabilizeFlowControl setShouldCancelHandler:](v3, "setShouldCancelHandler:", v89);
    -[_PIVideoStabilizeFlowControl setRangeMin:](v3, "setRangeMin:", 0.0);
    -[_PIVideoStabilizeFlowControl setRangeMax:](v3, "setRangeMax:", 0.75);
    v4 = -[PIVideoStabilizeRenderJob allowedAnalysisTypes](self, "allowedAnalysisTypes");
    v74 = v78;
    v75 = v3;
    v98 = 0;
    if ((v4 & 2) != 0)
    {
      v5 = -[PIVideoReframeMetadataExtractor initWithAVAsset:]([PIVideoReframeMetadataExtractor alloc], "initWithAVAsset:", v74);
      -[PIVideoReframeMetadataExtractor timedMetadataArray](v5, "timedMetadataArray");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        NUPixelSizeToCGSize();
        DictionaryRepresentation = CGSizeCreateDictionaryRepresentation(v115);
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        v96 = 0u;
        v97 = 0u;
        v95 = 0u;
        v94 = 0u;
        obj = v6;
        v83 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v94, buf, 16);
        if (v83)
        {
          v81 = *(_QWORD *)v95;
          do
          {
            for (i = 0; i != v83; ++i)
            {
              if (*(_QWORD *)v95 != v81)
                objc_enumerationMutation(obj);
              v7 = *(void **)(*((_QWORD *)&v94 + 1) + 8 * i);
              if (v7)
                objc_msgSend(*(id *)(*((_QWORD *)&v94 + 1) + 8 * i), "time");
              else
                memset(&v93, 0, sizeof(v93));
              time = v93;
              v84 = CMTimeCopyAsDictionary(&time, 0);
              objc_msgSend(v7, "trajectoryHomography");
              v87 = v9;
              v88 = v8;
              v86 = v10;
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", *(double *)&v8);
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              v104 = v11;
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", *(double *)&v87);
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              v105 = v12;
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", *(double *)&v86);
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              HIDWORD(v14) = DWORD1(v88);
              LODWORD(v14) = DWORD1(v88);
              v106 = v13;
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v14);
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              HIDWORD(v16) = DWORD1(v87);
              LODWORD(v16) = DWORD1(v87);
              v107 = v15;
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v16);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              HIDWORD(v18) = DWORD1(v86);
              LODWORD(v18) = DWORD1(v86);
              v108 = v17;
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v18);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v109 = v19;
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(DWORD1(v88), DWORD2(v88))));
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v110 = v20;
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(DWORD1(v87), DWORD2(v87))));
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v111 = v21;
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", COERCE_DOUBLE(__PAIR64__(DWORD1(v86), DWORD2(v86))));
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v112 = v22;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v104, 9);
              v23 = (void *)objc_claimAutoreleasedReturnValue();

              v24 = *MEMORY[0x1E0D3A9F0];
              v102[0] = *MEMORY[0x1E0D3A9F8];
              v102[1] = v24;
              v103[0] = v84;
              v103[1] = v23;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v103, v102, 2);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v82, "addObject:", v25);

            }
            v83 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v94, buf, 16);
          }
          while (v83);
        }

        v26 = *MEMORY[0x1E0D3A9E8];
        v100[0] = *MEMORY[0x1E0D3AA38];
        v100[1] = v26;
        v101[0] = DictionaryRepresentation;
        v101[1] = v82;
        v27 = *MEMORY[0x1E0D3AA08];
        v100[2] = *MEMORY[0x1E0D3AA00];
        v100[3] = v27;
        v101[2] = MEMORY[0x1E0C9AAB0];
        v101[3] = MEMORY[0x1E0C9AAB0];
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v101, v100, 4);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = ICSynthesizeAnalysis();
        if (!v29)
        {
          v30 = (void *)MEMORY[0x1E0D520A0];
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v98);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "failureError:object:", CFSTR("Failure in ICSynthesizeAnalysis"), v31);
          *a3 = (id)objc_claimAutoreleasedReturnValue();

        }
        if (!v29)
          goto LABEL_32;
        v32 = 2;
        goto LABEL_26;
      }
    }
    if ((v4 & 1) != 0)
    {
      if (ICAnalyzeInputMotion())
      {

        v32 = 1;
LABEL_26:
        if (-[NURenderJob isCanceled](self, "isCanceled"))
        {
          v34 = (void *)MEMORY[0x1E0D520A0];
          v35 = (void *)-[PIVideoStabilizeRenderJob copy](self, "copy");
          objc_msgSend(v34, "canceledError:object:", CFSTR("Stabilize request was cancelled"), v35);
          *a3 = (id)objc_claimAutoreleasedReturnValue();

          ICDestroyResult();
        }
        else
        {
          -[_PIVideoStabilizeFlowControl rangeMax](v75, "rangeMax");
          -[_PIVideoStabilizeFlowControl setRangeMin:](v75, "setRangeMin:");
          -[_PIVideoStabilizeFlowControl setRangeMax:](v75, "setRangeMax:", 1.0);
          objc_msgSend(v76, "nominalFrameRate");
          v37 = v36;
          -[PIVideoStabilizeRenderJob allowedCropFraction](self, "allowedCropFraction");
          v39 = v38;
          v104 = (void *)*MEMORY[0x1E0D3AA90];
          v40 = (void *)MEMORY[0x1E0CB37E8];
          v41 = v75;
          *(float *)&v42 = v37 * 60.0;
          objc_msgSend(v40, "numberWithFloat:", v42);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          *(_QWORD *)buf = v43;
          v105 = (void *)*MEMORY[0x1E0D3AA98];
          *(float *)&v44 = v37 * 50.0;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v44);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          *(_QWORD *)&buf[8] = v45;
          v106 = (void *)*MEMORY[0x1E0D3AA68];
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v39);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          *(_QWORD *)&buf[16] = v46;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, &v104, 3);
          v47 = (void *)objc_claimAutoreleasedReturnValue();

          LODWORD(v94) = 0;
          v48 = ICCalcCinematicL1Corrections();

          if (v48)
          {

            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            ICGetResultHomographies();
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            CreateKeyframesFromHomographyDictionary(v50, (CMTimeEpoch)v73, (uint64_t)v72, v49, (__int128 *)&self->_stabCropRect.origin.x);
            v51 = (NSArray *)objc_msgSend(v49, "copy");
            keyframes = self->_keyframes;
            self->_keyframes = v51;

            self->_analysisType = v32;
            objc_storeStrong((id *)&self->_rawHomographies, v50);
            ICDestroyResult();
            ICDestroyResult();

            v33 = 1;
LABEL_33:
            objc_destroyWeak(&v90);
            objc_destroyWeak(location);

            goto LABEL_34;
          }
          v56 = (void *)MEMORY[0x1E0D520A0];
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v94);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "failureError:object:", CFSTR("Failure in ICCalcCinematicL1Corrections"), v57);
          *a3 = (id)objc_claimAutoreleasedReturnValue();

          ICDestroyResult();
        }
LABEL_32:
        v33 = 0;
        goto LABEL_33;
      }
      v53 = (void *)MEMORY[0x1E0D520A0];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v98);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "failureError:object:", CFSTR("Failure in ICAnalyzeInputMotion"), v54);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D520A0], "failureError:object:", CFSTR("No available analysis types were allowed"), 0);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }

    goto LABEL_32;
  }
  return 0;
}

- (id)result
{
  _PIVideoStabilizeResult *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  _PIVideoStabilizeResult *v7;
  uint64_t v9;

  v3 = [_PIVideoStabilizeResult alloc];
  -[PIVideoStabilizeRenderJob keyframes](self, "keyframes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIVideoStabilizeRenderJob stabCropRect](self, "stabCropRect");
  v5 = -[PIVideoStabilizeRenderJob analysisType](self, "analysisType");
  -[PIVideoStabilizeRenderJob rawHomographies](self, "rawHomographies");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[_PIVideoStabilizeResult initWithKeyframes:stabCropRect:analysisType:rawHomographies:](v3, "initWithKeyframes:stabCropRect:analysisType:rawHomographies:", v4, &v9, v5, v6);

  return v7;
}

- (NSArray)keyframes
{
  return self->_keyframes;
}

- ($B5E4F2499D3E0A90C7E8AF059312C337)stabCropRect
{
  $0AC6E346AE4835514AAA8AC86D8F4844 v3;

  v3 = *($0AC6E346AE4835514AAA8AC86D8F4844 *)&self[9].var0.var1;
  retstr->var0 = *($0AC6E346AE4835514AAA8AC86D8F4844 *)&self[8].var1.var1;
  retstr->var1 = v3;
  return self;
}

- (unint64_t)allowedAnalysisTypes
{
  return self->_allowedAnalysisTypes;
}

- (void)setAllowedAnalysisTypes:(unint64_t)a3
{
  self->_allowedAnalysisTypes = a3;
}

- (unint64_t)analysisType
{
  return self->_analysisType;
}

- (double)allowedCropFraction
{
  return self->_allowedCropFraction;
}

- (void)setAllowedCropFraction:(double)a3
{
  self->_allowedCropFraction = a3;
}

- (id)progressHandler
{
  return self->_progressHandler;
}

- (void)setProgressHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

- (NSDictionary)rawHomographies
{
  return self->_rawHomographies;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawHomographies, 0);
  objc_storeStrong(&self->_progressHandler, 0);
  objc_storeStrong((id *)&self->_keyframes, 0);
}

uint64_t __37__PIVideoStabilizeRenderJob_prepare___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_msgSend(WeakRetained, "isCanceled");

  return v2;
}

@end
