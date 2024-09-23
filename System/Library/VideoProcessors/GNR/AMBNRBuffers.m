@implementation AMBNRBuffers

+ (int)bindFP16PyramidToU8:(id)a3 pyr_u8:(id)a4 metal:(id)a5
{
  _DWORD *v7;
  _DWORD *v8;
  id v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  int v17;
  int v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  int v35;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v8[2] = v7[2];
  if ((int)v8[2] >= 2)
  {
    for (i = 1; i < (int)v8[2]; ++i)
    {
      objc_msgSend(*(id *)&v7[2 * i + 84], "buffer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        objc_msgSend(*(id *)&v7[2 * i + 84], "buffer");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "create2DTextureFromBuffer:offset:width:height:format:usage:", v12, objc_msgSend(*(id *)&v7[2 * i + 84], "bufferOffset"), objc_msgSend(*(id *)&v7[2 * i + 84], "width"), objc_msgSend(*(id *)&v7[2 * i + 84], "height"), 10, 23);
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = *(void **)&v8[2 * i + 84];
        *(_QWORD *)&v8[2 * i + 84] = v13;

        if (!*(_QWORD *)&v8[2 * i + 84])
          goto LABEL_20;
        objc_msgSend(*(id *)&v7[2 * i + 84], "buffer");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(*(id *)&v7[2 * i + 84], "bufferOffset");
        v17 = objc_msgSend(*(id *)&v7[2 * i + 84], "width");
        v18 = v17 >= 0 ? v17 : v17 + 1;
        objc_msgSend(v9, "create2DTextureFromBuffer:offset:width:height:format:usage:", v15, v16, (v18 >> 1), objc_msgSend(*(id *)&v7[2 * i + 84], "height"), 30, 23);
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = *(void **)&v8[2 * i + 164];
        *(_QWORD *)&v8[2 * i + 164] = v19;

        if (!*(_QWORD *)&v8[2 * i + 164])
          goto LABEL_20;
        objc_msgSend(*(id *)&v7[2 * i + 124], "buffer");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "create2DTextureFromBuffer:offset:width:height:format:usage:", v21, objc_msgSend(*(id *)&v7[2 * i + 124], "bufferOffset"), objc_msgSend(*(id *)&v7[2 * i + 124], "width"), objc_msgSend(*(id *)&v7[2 * i + 124], "height"), 30, 23);
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = *(void **)&v8[2 * i + 124];
        *(_QWORD *)&v8[2 * i + 124] = v22;

        if (!*(_QWORD *)&v8[2 * i + 124])
          goto LABEL_20;
        objc_msgSend(*(id *)&v7[2 * i + 124], "buffer");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "create2DTextureFromBuffer:offset:width:height:format:usage:", v24, objc_msgSend(*(id *)&v7[2 * i + 124], "bufferOffset"), objc_msgSend(*(id *)&v7[2 * i + 124], "width"), objc_msgSend(*(id *)&v7[2 * i + 124], "height"), 23, 23);
        v25 = objc_claimAutoreleasedReturnValue();
        v26 = *(void **)&v8[2 * i + 204];
        *(_QWORD *)&v8[2 * i + 204] = v25;

        if (!*(_QWORD *)&v8[2 * i + 204])
        {
LABEL_20:
          FigDebugAssert3();
          v35 = FigSignalErrorAt();
          goto LABEL_19;
        }
      }
      else
      {
        objc_msgSend(v9, "rebindTex:format:usage:plane:xFactor:", *(_QWORD *)&v7[2 * i + 84], 10, 23, 0, 1);
        v27 = objc_claimAutoreleasedReturnValue();
        v28 = *(void **)&v8[2 * i + 84];
        *(_QWORD *)&v8[2 * i + 84] = v27;

        if (!*(_QWORD *)&v8[2 * i + 84])
          goto LABEL_20;
        objc_msgSend(v9, "rebindTex:format:usage:plane:xFactor:", *(_QWORD *)&v7[2 * i + 124], 30, 23, 0, 1);
        v29 = objc_claimAutoreleasedReturnValue();
        v30 = *(void **)&v8[2 * i + 124];
        *(_QWORD *)&v8[2 * i + 124] = v29;

        if (!*(_QWORD *)&v8[2 * i + 124])
          goto LABEL_20;
        objc_msgSend(v9, "rebindTex:format:usage:plane:xFactor:", *(_QWORD *)&v8[2 * i + 84], 30, 23, 0, 2);
        v31 = objc_claimAutoreleasedReturnValue();
        v32 = *(void **)&v8[2 * i + 164];
        *(_QWORD *)&v8[2 * i + 164] = v31;

        if (!*(_QWORD *)&v8[2 * i + 164])
          goto LABEL_20;
        objc_msgSend(v9, "rebindTex:format:usage:plane:xFactor:", *(_QWORD *)&v8[2 * i + 124], 23, 23, 0, 1);
        v33 = objc_claimAutoreleasedReturnValue();
        v34 = *(void **)&v8[2 * i + 204];
        *(_QWORD *)&v8[2 * i + 204] = v33;

        if (!*(_QWORD *)&v8[2 * i + 204])
          goto LABEL_20;
      }
      *(_QWORD *)&v8[2 * i + 4] = 0;
      *((_BYTE *)v8 + i + 976) = 0;
    }
  }
  v35 = 0;
LABEL_19:

  return v35;
}

+ (int)createAMBNRPyramidFromWidth:(unint64_t)a3 height:(unint64_t)a4 pyramid:(id)a5 metal:(id)a6 useHalfFloat:(BOOL)a7 scratchBuffer:(id)a8 offset:(unint64_t *)a9
{
  _DWORD *v14;
  id v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const void *v21;
  int v22;
  uint64_t v23;
  uint64_t PixelBuffer;
  const void *v25;
  const void *v26;
  int v27;
  int v28;
  id v30;

  v14 = a5;
  v15 = a6;
  v30 = a8;
  v14[2] = 4;
  if ((int)v14[2] < 2)
  {
LABEL_17:
    v28 = 0;
  }
  else
  {
    v16 = (a4 + 1) >> 1;
    v17 = (a3 + 1) >> 1;
    if (a7)
    {
      if (v30)
      {
        v18 = 1;
        while (!+[AMBNRBuffers aliasAMBNRPyramidLevel:lvl:width:height:useHalfFloat:metal:scratchBuffer:offset:](AMBNRBuffers, "aliasAMBNRPyramidLevel:lvl:width:height:useHalfFloat:metal:scratchBuffer:offset:", v14, v18, v17, v16, 1, v15, v30, a9))
        {
          *((_BYTE *)v14 + v18++ + 976) = 1;
          v16 = (v16 + 1) >> 1;
          v17 = (v17 + 1) >> 1;
          if (v18 >= (int)v14[2])
            goto LABEL_17;
        }
      }
      else
      {
        v23 = 1;
        while (1)
        {
          PixelBuffer = CreatePixelBuffer();
          if (!PixelBuffer)
            break;
          v25 = (const void *)PixelBuffer;
          v26 = (const void *)CreatePixelBuffer();
          v27 = objc_msgSend(v14, "setPixelBufferFloat16:chromaBuffer:level:metal:", v25, v26, v23, v15);
          CFRelease(v25);
          CFRelease(v26);
          if (v27)
            break;
          v23 = (v23 + 1);
          v16 = (v16 + 1) >> 1;
          v17 = (v17 + 1) >> 1;
          if ((int)v23 >= v14[2])
            goto LABEL_17;
        }
      }
    }
    else
    {
      v19 = 1;
      while (1)
      {
        v20 = CreatePixelBuffer();
        if (!v20)
          break;
        v21 = (const void *)v20;
        v22 = objc_msgSend(v14, "setPixelBuffer:level:metal:", v20, v19, v15);
        CFRelease(v21);
        if (v22)
          break;
        v19 = (v19 + 1);
        v16 = (v16 + 1) >> 1;
        v17 = (v17 + 1) >> 1;
        if ((int)v19 >= v14[2])
          goto LABEL_17;
      }
    }
    FigDebugAssert3();
    v28 = FigSignalErrorAt();
  }

  return v28;
}

- (void)releaseBuffers
{
  -[PyramidStorage releaseBuffers](self->pyramid, "releaseBuffers");
  -[PyramidStorage releaseBuffers](self->laplacianPyramid, "releaseBuffers");
  -[PyramidStorage releaseBuffers](self->denoisedPyramid[0], "releaseBuffers");
  -[PyramidStorage releaseBuffers](self->denoisedPyramid[1], "releaseBuffers");
  -[PyramidStorage releaseBuffers](self->denoisedPyramid[2], "releaseBuffers");
  -[PyramidStorage releaseBuffers](self->denoisedPyramid[3], "releaseBuffers");
}

- (AMBNRBuffers)init
{
  AMBNRBuffers *v2;
  PyramidStorage *v3;
  PyramidStorage *pyramid;
  PyramidStorage *v5;
  PyramidStorage *laplacianPyramid;
  PyramidStorage *v7;
  PyramidStorage *v8;
  PyramidStorage *v9;
  PyramidStorage *v10;
  PyramidStorage *v11;
  PyramidStorage *v12;
  PyramidStorage *v13;
  PyramidStorage *v14;
  AMBNRBuffers *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)AMBNRBuffers;
  v2 = -[AMBNRBuffers init](&v17, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(PyramidStorage);
    pyramid = v2->pyramid;
    v2->pyramid = v3;

    v5 = objc_alloc_init(PyramidStorage);
    laplacianPyramid = v2->laplacianPyramid;
    v2->laplacianPyramid = v5;

    v7 = objc_alloc_init(PyramidStorage);
    v8 = v2->denoisedPyramid[0];
    v2->denoisedPyramid[0] = v7;

    v9 = objc_alloc_init(PyramidStorage);
    v10 = v2->denoisedPyramid[1];
    v2->denoisedPyramid[1] = v9;

    v11 = objc_alloc_init(PyramidStorage);
    v12 = v2->denoisedPyramid[2];
    v2->denoisedPyramid[2] = v11;

    v13 = objc_alloc_init(PyramidStorage);
    v14 = v2->denoisedPyramid[3];
    v2->denoisedPyramid[3] = v13;

    v15 = v2;
  }

  return v2;
}

- (void)releasePyramidsBottom
{
  -[PyramidStorage clearLevel:](self->pyramid, "clearLevel:", 0);
  -[PyramidStorage clearLevel:](self->laplacianPyramid, "clearLevel:", 0);
  -[PyramidStorage clearLevel:](self->denoisedPyramid[0], "clearLevel:", 0);
  -[PyramidStorage clearLevel:](self->denoisedPyramid[1], "clearLevel:", 0);
  -[PyramidStorage clearLevel:](self->denoisedPyramid[2], "clearLevel:", 0);
  -[PyramidStorage clearLevel:](self->denoisedPyramid[3], "clearLevel:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->denoisedPyramid[3], 0);
  objc_storeStrong((id *)&self->denoisedPyramid[2], 0);
  objc_storeStrong((id *)&self->denoisedPyramid[1], 0);
  objc_storeStrong((id *)self->denoisedPyramid, 0);
  objc_storeStrong((id *)&self->laplacianPyramid, 0);
  objc_storeStrong((id *)&self->pyramid, 0);
}

+ (int)aliasAMBNRPyramidLevel:(id)a3 lvl:(int)a4 width:(int)a5 height:(int)a6 useHalfFloat:(BOOL)a7 metal:(id)a8 scratchBuffer:(id)a9 offset:(unint64_t *)a10
{
  int v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v15;
  id v16;
  id v17;
  __IOSurface *v18;
  __IOSurface *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  void *v28;
  int v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  int v39;
  unint64_t v40;
  int v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  int v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  BOOL v52;
  int v53;
  unint64_t v54;
  int v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  int v63;

  v11 = a7;
  v12 = *(_QWORD *)&a6;
  v13 = *(_QWORD *)&a5;
  v15 = a3;
  v16 = a8;
  v17 = a9;
  v18 = (__IOSurface *)objc_msgSend(v17, "iosurface");
  if (v18)
  {
    v19 = v18;
    if (IOSurfaceGetPlaneCount(v18) == 2)
    {
      if (v11)
        v20 = 25;
      else
        v20 = 10;
      objc_msgSend(v16, "bindIOSurfaceToMTL2DTexture:pixelFormat:usage:width:height:plane:", v19, v20, 23, (int)v13, (int)v12, 0);
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = a4;
      v23 = (void *)v15[v22 + 42];
      v15[v22 + 42] = v21;

      if (v15[v22 + 42])
      {
        v24 = a4;
        if (v11)
          v25 = 65;
        else
          v25 = 30;
        if ((int)v13 >= 0)
          v26 = v13;
        else
          v26 = v13 + 1;
        objc_msgSend(v16, "bindIOSurfaceToMTL2DTexture:pixelFormat:usage:width:height:plane:", v19, v25, 23, (uint64_t)v26 >> 1, (int)v12, 0);
        v27 = objc_claimAutoreleasedReturnValue();
        v28 = (void *)v15[v24 + 82];
        v15[v24 + 82] = v27;

        if (v15[v24 + 82])
        {
          v29 = v13 + 2;
          if ((int)v13 >= -1)
            v29 = v13 + 1;
          v30 = v12 + 2;
          if ((int)v12 >= -1)
            v30 = v12 + 1;
          v31 = (uint64_t)v29 >> 1;
          v32 = (uint64_t)v30 >> 1;
          objc_msgSend(v16, "bindIOSurfaceToMTL2DTexture:pixelFormat:usage:width:height:plane:", v19, v25, 23, v31, v32, 1);
          v33 = objc_claimAutoreleasedReturnValue();
          v34 = (void *)v15[v24 + 62];
          v15[v24 + 62] = v33;

          if (v15[v24 + 62])
          {
            if (v11)
              v35 = 53;
            else
              v35 = 23;
            v36 = v16;
            objc_msgSend(v16, "bindIOSurfaceToMTL2DTexture:pixelFormat:usage:width:height:plane:", v19, v35, 23, v31, v32, 1);
            v37 = objc_claimAutoreleasedReturnValue();
            v38 = (void *)v15[v24 + 102];
            v15[v24 + 102] = v37;

            if (v15[v24 + 102])
            {
              v39 = 0;
              goto LABEL_50;
            }
          }
          else
          {
            v36 = v16;
          }
        }
        else
        {
          v36 = v16;
        }
      }
      else
      {
        v36 = v16;
      }
    }
    else
    {
      v36 = v16;
    }
LABEL_59:
    FigDebugAssert3();
    v39 = FigSignalErrorAt();
    goto LABEL_50;
  }
  if (a10)
    v40 = *a10;
  else
    v40 = 0;
  v41 = v13 + 2;
  if ((int)v13 >= -1)
    v41 = v13 + 1;
  v63 = v41;
  if (v11)
    v42 = 25;
  else
    v42 = 10;
  objc_msgSend(v16, "create2DTextureFromBuffer:offset:width:height:format:usage:", v17, v40, v13, v12, v42, 23);
  v43 = objc_claimAutoreleasedReturnValue();
  v44 = a4;
  v45 = (void *)v15[v44 + 42];
  v15[v44 + 42] = v43;

  if (!v15[v44 + 42])
  {
    v36 = v16;
    goto LABEL_59;
  }
  v46 = a4;
  if ((int)v13 >= 0)
    v47 = v13;
  else
    v47 = v13 + 1;
  if (v11)
    v48 = 65;
  else
    v48 = 30;
  objc_msgSend(v16, "create2DTextureFromBuffer:offset:width:height:format:usage:", v17, v40, (v47 >> 1), v12, v48, 23);
  v49 = objc_claimAutoreleasedReturnValue();
  v50 = v46;
  v51 = (void *)v15[v46 + 82];
  v15[v46 + 82] = v49;

  if (!v15[v46 + 82])
  {
    v36 = v16;
    goto LABEL_59;
  }
  v53 = v12 + 1;
  v52 = (int)v12 < -1;
  v54 = v40 + ((((_DWORD)v13 << v11) + 63) & 0xFFFFFFC0) * (uint64_t)(int)v12;
  if (v52)
    v55 = v53 + 1;
  else
    v55 = v53;
  v56 = (v55 >> 1);
  objc_msgSend(v16, "create2DTextureFromBuffer:offset:width:height:format:usage:", v17, v54, (v63 >> 1), v56, v48, 23);
  v57 = objc_claimAutoreleasedReturnValue();
  v58 = (void *)v15[v50 + 62];
  v15[v50 + 62] = v57;

  if (!v15[v50 + 62])
  {
    v36 = v16;
    goto LABEL_59;
  }
  if (v11)
    v59 = 53;
  else
    v59 = 23;
  v36 = v16;
  objc_msgSend(v16, "create2DTextureFromBuffer:offset:width:height:format:usage:", v17, v54, (v63 >> 1), v56, v59, 23);
  v60 = objc_claimAutoreleasedReturnValue();
  v61 = (void *)v15[v50 + 102];
  v15[v50 + 102] = v60;

  if (!v15[v50 + 102])
    goto LABEL_59;
  v39 = 0;
  if (a10)
    *a10 = v54 + (((unint64_t)((((v63 & 0xFFFFFFFE) << v11) + 63) & 0xFFFFFFC0) * v53) >> 1);
LABEL_50:

  return v39;
}

@end
