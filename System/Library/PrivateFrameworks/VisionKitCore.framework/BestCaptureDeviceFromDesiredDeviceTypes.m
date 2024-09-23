@implementation BestCaptureDeviceFromDesiredDeviceTypes

void ___BestCaptureDeviceFromDesiredDeviceTypes_block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  int v5;
  double v6;
  double v7;
  id v8;
  id v9;
  double v10;
  unint64_t Dimensions;
  int32_t v12;
  unint64_t v13;
  CMVideoDimensions v14;
  double v15;
  int v16;
  double v17;
  int v18;
  double v19;
  double height;
  double v21;
  double v22;
  id v23;
  FourCharCode MediaSubType;
  const opaqueCMFormatDescription *v25;
  FourCharCode v26;
  id v28;
  id v29;
  int v30;
  uint64_t v31;
  id v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  id v41;

  v41 = a2;
  v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if (!v4)
    goto LABEL_19;
  v5 = *(unsigned __int8 *)(a1 + 56);
  v6 = *(double *)(a1 + 40);
  v7 = *(double *)(a1 + 48);
  v8 = v4;
  v9 = v41;
  if (v6 >= v7)
    v10 = v6;
  else
    v10 = v7;
  if (v6 >= v7)
    v6 = v7;
  Dimensions = (unint64_t)CMVideoFormatDescriptionGetDimensions((CMVideoFormatDescriptionRef)objc_msgSend(v8, "formatDescription"));
  v12 = Dimensions;
  v13 = HIDWORD(Dimensions);
  v14 = CMVideoFormatDescriptionGetDimensions((CMVideoFormatDescriptionRef)objc_msgSend(v9, "formatDescription"));
  v15 = (double)v12 - v10;
  if (v15 < 0.0)
    v15 = -v15;
  v16 = (int)v15;
  v17 = (double)v14.width - v10;
  if (v17 < 0.0)
    v17 = -v17;
  v18 = (int)v17;
  v19 = (double)(int)v13 - v6;
  height = (double)v14.height;
  if (v19 < 0.0)
    v19 = -v19;
  v21 = height - v6;
  v22 = -(height - v6);
  if (v21 < 0.0)
    v21 = v22;
  if (v16 < v18)
    goto LABEL_16;
  if (v16 > v18)
  {
LABEL_18:

LABEL_19:
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    goto LABEL_20;
  }
  if ((int)v19 >= (int)v21)
  {
    if ((int)v19 > (int)v21)
      goto LABEL_18;
    v23 = v9;
    MediaSubType = CMFormatDescriptionGetMediaSubType((CMFormatDescriptionRef)objc_msgSend(v8, "formatDescription"));
    v25 = (const opaqueCMFormatDescription *)objc_msgSend(v23, "formatDescription");

    v26 = CMFormatDescriptionGetMediaSubType(v25);
    if (MediaSubType != 875704422 || v26 == 875704422)
    {
      if (v26 == 875704422 || MediaSubType == 875704422)
      {
        if (v26 == 875704422 && MediaSubType != 875704422)
          goto LABEL_18;
      }
      else
      {
        if (MediaSubType == 1111970369 && v26 != 1111970369)
          goto LABEL_16;
        if (v26 == 1111970369 && MediaSubType != 1111970369)
          goto LABEL_18;
      }
      v28 = v8;
      v29 = v23;
      v30 = objc_msgSend(v28, "isVideoBinned");
      if (v5)
      {
        if (!v30 || objc_msgSend(v29, "isVideoBinned"))
        {
          if (objc_msgSend(v29, "isVideoBinned"))
          {
            v31 = objc_msgSend(v28, "isVideoBinned") - 1;
            goto LABEL_46;
          }
          goto LABEL_48;
        }
        v31 = 1;
      }
      else
      {
        if (!v30 || objc_msgSend(v29, "isVideoBinned"))
        {
          if (objc_msgSend(v29, "isVideoBinned"))
          {
            v31 = objc_msgSend(v28, "isVideoBinned") ^ 1;
LABEL_46:

            if (v31)
              goto LABEL_56;
            goto LABEL_49;
          }
LABEL_48:

LABEL_49:
          v32 = v29;
          _SlowestMaxFrameRateRange(v28);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          _SlowestMaxFrameRateRange(v32);
          v34 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v33, "maxFrameRate");
          v36 = v35;
          objc_msgSend(v34, "maxFrameRate");
          if (v36 <= v37)
          {
            objc_msgSend(v33, "maxFrameRate");
            v39 = v38;
            objc_msgSend(v34, "maxFrameRate");
            v31 = v39 < v40;
          }
          else
          {
            v31 = -1;
          }
          goto LABEL_55;
        }
        v31 = -1;
      }
      v34 = v29;
      v33 = v28;
LABEL_55:

LABEL_56:
      if (v31 != -1)
        goto LABEL_20;
      goto LABEL_19;
    }
  }
LABEL_16:

LABEL_20:
}

@end
