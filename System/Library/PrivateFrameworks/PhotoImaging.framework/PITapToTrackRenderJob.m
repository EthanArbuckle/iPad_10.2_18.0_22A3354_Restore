@implementation PITapToTrackRenderJob

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

- (id)result
{
  return -[_PITapToTrackRenderResult initWithCompletedTrack:]([_PITapToTrackRenderResult alloc], "initWithCompletedTrack:", self->_completedTrack);
}

- (BOOL)prepare:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  BOOL v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  void *v27;
  const __CFString *v28;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  char *v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  int v48;
  double v49;
  void *v50;
  void *v51;
  void *v52;
  NSObject *v53;
  void *v54;
  void *v55;
  void *v56;
  NSObject *v57;
  void *v58;
  const void **v59;
  void *specific;
  NSObject *v61;
  _BOOL4 v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  id v67;
  void *v68;
  void *v69;
  NSObject *log;
  NSObject *loga;
  void *i;
  void *v73;
  void *v74;
  char v75;
  _BYTE v76[24];
  char v77;
  _BYTE v78[24];
  _BYTE v79[24];
  objc_super v80;
  uint8_t buf[4];
  void *v82;
  __int16 v83;
  void *v84;
  uint64_t v85;
  CGRect v86;
  CGRect v87;

  v85 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    NUAssertLogger_181();
    v57 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v82 = v58;
      _os_log_error_impl(&dword_1A6382000, v57, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v59 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_181();
    v61 = objc_claimAutoreleasedReturnValue();
    v62 = os_log_type_enabled(v61, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v62)
      {
        v65 = dispatch_get_specific(*v59);
        v66 = (void *)MEMORY[0x1E0CB3978];
        v67 = v65;
        objc_msgSend(v66, "callStackSymbols");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "componentsJoinedByString:", CFSTR("\n"));
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v82 = v65;
        v83 = 2114;
        v84 = v69;
        _os_log_error_impl(&dword_1A6382000, v61, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v62)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "componentsJoinedByString:", CFSTR("\n"));
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v82 = v64;
      _os_log_error_impl(&dword_1A6382000, v61, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  v80.receiver = self;
  v80.super_class = (Class)PITapToTrackRenderJob;
  if (-[NURenderJob prepare:](&v80, sel_prepare_))
  {
    -[NURenderJob request](self, "request");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "device");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D52228], "currentPlatform");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "mainDevice");
      v8 = (id)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v8, "metalDevice");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (!v11)
    {
      objc_msgSend(MEMORY[0x1E0D520A0], "missingError:object:", CFSTR("No metal device for request"), v8);
      v9 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_25:

      return v9;
    }
    v13 = (void *)objc_msgSend(v11, "newCommandQueue");
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7F5A8]), "initWithCommandQueue:", v13);
    -[NURenderJob outputVideo](self, "outputVideo");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7F528]), "initWithAsset:", v15);
      if (!v16)
      {
        v27 = (void *)MEMORY[0x1E0D520A0];
        objc_msgSend(v15, "description");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = CFSTR("Failed to make asset reader for video");
        goto LABEL_22;
      }
      -[PITapToTrackRenderJob startTime](self, "startTime");
      if (objc_msgSend(v16, "startReadingFrames:atTime:error:", 6, v79, a3))
      {
        v17 = objc_msgSend(v16, "nextFrame");
        if (v17)
        {
          v18 = (void *)v17;
          -[PITapToTrackRenderJob normalizedImagePoint](self, "normalizedImagePoint");
          objc_msgSend(v14, "getRectForPoint:colorBuffer:", objc_msgSend(v18, "colorBuffer"), v19, v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v74 = v21;
          if (v21 && (v22 = v21, objc_msgSend(v21, "rect"), !CGRectIsEmpty(v86)))
          {
            objc_msgSend(v22, "rect");
            v31 = v30;
            v33 = v32;
            v35 = v34;
            v37 = v36;
            objc_msgSend(v18, "time");
            if ((objc_msgSend(v14, "addDetectionAndStartTrackingRect:time:colorBuffer:disparityBuffer:", v78, objc_msgSend(v18, "colorBuffer"), objc_msgSend(v18, "disparityBuffer"), v31, v33, v35, v37) & 1) != 0)
            {
              v38 = &v77;
              v73 = v18;
              objc_msgSend(v18, "time");
              v39 = v74;
              for (i = v13; ; v13 = i)
              {
                objc_msgSend(v39, "rect");
                v41 = v40;
                v43 = v42;
                v45 = v44;
                v47 = v46;
                v74 = v39;
                objc_msgSend(v39, "confidence");
                LODWORD(v49) = v48;
                -[PITapToTrackRenderJob _reportProgressAtTime:rect:confidence:](self, "_reportProgressAtTime:rect:confidence:", v38, v41, v43, v45, v47, v49);
                if (-[PITapToTrackRenderJob clientRequestedStop](self, "clientRequestedStop"))
                  break;
                v50 = v14;
                v51 = (void *)objc_msgSend(v16, "nextFrame");

                if (!v51)
                {
                  v18 = 0;
                  v14 = v50;
                  v13 = i;
                  goto LABEL_43;
                }
                objc_msgSend(v51, "time");
                objc_msgSend(v50, "addDetectionForNextFrameAt:colorBuffer:disparityBuffer:", v76, objc_msgSend(v51, "colorBuffer"), objc_msgSend(v51, "disparityBuffer"));
                v39 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v39 || (objc_msgSend(v39, "rect"), CGRectIsEmpty(v87)))
                {
                  NULogger();
                  log = objc_claimAutoreleasedReturnValue();
                  v74 = v39;
                  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
                  {
                    objc_msgSend(v51, "time");
                    NUStringFromTime();
                    v52 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412290;
                    v82 = v52;
                    v53 = log;
                    _os_log_impl(&dword_1A6382000, log, OS_LOG_TYPE_INFO, "Tap-to-track: tracking lost at %@", buf, 0xCu);

                    v18 = v51;
                    v14 = v50;
                  }
                  else
                  {
                    v18 = v51;
                    v14 = v50;
                    v53 = log;
                  }
                  v13 = i;
                  goto LABEL_42;
                }
                v38 = &v75;
                objc_msgSend(v51, "time");
                v73 = v51;
                v14 = v50;
              }
              NULogger();
              v53 = objc_claimAutoreleasedReturnValue();
              v18 = v73;
              if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
              {
                objc_msgSend(v73, "time");
                NUStringFromTime();
                loga = v53;
                v54 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                v82 = v54;
                _os_log_impl(&dword_1A6382000, loga, OS_LOG_TYPE_INFO, "Tap-to-track: client requested stop at %@", buf, 0xCu);

                v53 = loga;
              }
LABEL_42:

LABEL_43:
              objc_msgSend(v16, "stopReadingFrames");
              objc_msgSend(v14, "finalizeTrack");
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              -[PITapToTrackRenderJob setCompletedTrack:](self, "setCompletedTrack:", v55);

              -[PITapToTrackRenderJob completedTrack](self, "completedTrack");
              v56 = (void *)objc_claimAutoreleasedReturnValue();

              if (v56)
              {
                v9 = 1;
                goto LABEL_16;
              }
              v23 = (void *)MEMORY[0x1E0D520A0];
              -[NURenderJob description](self, "description");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v25 = CFSTR("Failed to get finalized track from tracking session");
            }
            else
            {
              v23 = (void *)MEMORY[0x1E0D520A0];
              -[NURenderJob description](self, "description");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v25 = CFSTR("Failed to add detection and start tracking");
            }
          }
          else
          {
            v23 = (void *)MEMORY[0x1E0D520A0];
            -[NURenderJob description](self, "description");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = CFSTR("Failed to find rect to track at initial point");
          }
          objc_msgSend(v23, "missingError:object:", v25, v24);
          *a3 = (id)objc_claimAutoreleasedReturnValue();

          v9 = 0;
LABEL_16:

LABEL_23:
          goto LABEL_24;
        }
        v27 = (void *)MEMORY[0x1E0D520A0];
        objc_msgSend(v15, "description");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = CFSTR("Failed to read first frame for video");
LABEL_22:
        objc_msgSend(v27, "missingError:object:", v28, v18);
        v9 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_23;
      }
      v9 = 0;
    }
    else
    {
      v26 = (void *)MEMORY[0x1E0D520A0];
      -[NURenderJob description](self, "description");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "missingError:object:", CFSTR("Failed to find output video asset"), v16);
      v9 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
LABEL_24:

    goto LABEL_25;
  }
  return 0;
}

- (void)_reportProgressAtTime:(id *)a3 rect:(CGRect)a4 confidence:(float)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v12;
  void *v13;
  NSObject *v14;
  _QWORD block[4];
  id v16;
  id v17[5];
  __int128 v18;
  int64_t var3;
  float v20;
  id location;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  -[PITapToTrackRenderJob progressHandler](self, "progressHandler");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_initWeak(&location, self);
    -[NURenderJob request](self, "request");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "responseQueue");
    v14 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __63__PITapToTrackRenderJob__reportProgressAtTime_rect_confidence___block_invoke;
    block[3] = &unk_1E5015320;
    v16 = v12;
    v18 = *(_OWORD *)&a3->var0;
    var3 = a3->var3;
    v17[1] = *(id *)&x;
    v17[2] = *(id *)&y;
    v17[3] = *(id *)&width;
    v17[4] = *(id *)&height;
    v20 = a5;
    objc_copyWeak(v17, &location);
    dispatch_async(v14, block);

    objc_destroyWeak(v17);
    objc_destroyWeak(&location);
  }

}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)startTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 272);
  return self;
}

- (void)setStartTime:(id *)a3
{
  int64_t var3;

  var3 = a3->var3;
  *(_OWORD *)&self->_startTime.value = *(_OWORD *)&a3->var0;
  self->_startTime.epoch = var3;
}

- (CGPoint)normalizedImagePoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_normalizedImagePoint.x;
  y = self->_normalizedImagePoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setNormalizedImagePoint:(CGPoint)a3
{
  self->_normalizedImagePoint = a3;
}

- (id)progressHandler
{
  return self->_progressHandler;
}

- (void)setProgressHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 240);
}

- (PTCinematographyTrack)completedTrack
{
  return self->_completedTrack;
}

- (void)setCompletedTrack:(id)a3
{
  objc_storeStrong((id *)&self->_completedTrack, a3);
}

- (BOOL)clientRequestedStop
{
  return self->_clientRequestedStop;
}

- (void)setClientRequestedStop:(BOOL)a3
{
  self->_clientRequestedStop = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completedTrack, 0);
  objc_storeStrong(&self->_progressHandler, 0);
}

void __63__PITapToTrackRenderJob__reportProgressAtTime_rect_confidence___block_invoke(uint64_t a1)
{
  (*(void (**)(double, double, double, double, float))(*(_QWORD *)(a1 + 32) + 16))(*(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(float *)(a1 + 104));
}

@end
