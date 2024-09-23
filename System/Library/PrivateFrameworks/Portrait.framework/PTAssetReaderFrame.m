@implementation PTAssetReaderFrame

- (void)dealloc
{
  objc_super v3;

  if (-[PTAssetReaderFrame disparityBuffer](self, "disparityBuffer"))
    CVPixelBufferRelease(-[PTAssetReaderFrame disparityBuffer](self, "disparityBuffer"));
  if (-[PTAssetReaderFrame colorBuffer](self, "colorBuffer"))
    CVPixelBufferRelease(-[PTAssetReaderFrame colorBuffer](self, "colorBuffer"));
  v3.receiver = self;
  v3.super_class = (Class)PTAssetReaderFrame;
  -[PTAssetReaderFrame dealloc](&v3, sel_dealloc);
}

- (id)_jsonFriendlyObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD v22[5];
  id v23;
  _BYTE v24[128];
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1E0CB36D8];
  v25[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = objc_msgSend(v5, "isValidJSONObject:", v6);

  if ((_DWORD)v5)
  {
    v7 = v4;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = (void *)objc_opt_new();
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __42__PTAssetReaderFrame__jsonFriendlyObject___block_invoke;
      v22[3] = &unk_1E822A128;
      v22[4] = self;
      v9 = v8;
      v23 = v9;
      objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v22);
      v10 = v23;
      v7 = v9;

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = (id)objc_opt_new();
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        v11 = v4;
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v19;
          do
          {
            v15 = 0;
            do
            {
              if (*(_QWORD *)v19 != v14)
                objc_enumerationMutation(v11);
              -[PTAssetReaderFrame _jsonFriendlyObject:](self, "_jsonFriendlyObject:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v15), (_QWORD)v18);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              if (v16)
                objc_msgSend(v7, "addObject:", v16);

              ++v15;
            }
            while (v13 != v15);
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
          }
          while (v13);
        }

      }
      else
      {
        v7 = 0;
      }
    }
  }

  return v7;
}

void __42__PTAssetReaderFrame__jsonFriendlyObject___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_jsonFriendlyObject:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v6, v7);

  }
}

- (NSDictionary)jsonFriendlyMetadata
{
  void *v3;
  void *v4;
  void *v5;

  -[PTAssetReaderFrame metadata](self, "metadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PTAssetReaderFrame metadata](self, "metadata");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PTAssetReaderFrame _jsonFriendlyObject:](self, "_jsonFriendlyObject:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return (NSDictionary *)v5;
}

- (PTAssetReaderFrame)initWithAssetReaderFrame:(id)a3
{
  id v4;
  PTAssetReaderFrame *v5;
  PTAssetReaderFrame *v6;
  $95D729B680665BEAEFA1D6FCA8238556 *p_time;
  void *v8;
  uint64_t v9;
  NSDictionary *metadata;
  $95D729B680665BEAEFA1D6FCA8238556 *p_colorBufferTime;
  $95D729B680665BEAEFA1D6FCA8238556 *p_disparityBufferTime;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  int64_t v19;
  __int128 v20;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)PTAssetReaderFrame;
  v5 = -[PTAssetReaderFrame init](&v21, sel_init);
  v6 = v5;
  if (v5)
  {
    p_time = &v5->_time;
    if (v4)
    {
      objc_msgSend(v4, "time");
    }
    else
    {
      v14 = 0uLL;
      *(_QWORD *)&v18 = 0;
    }
    *(_OWORD *)&p_time->value = v14;
    v6->_time.epoch = v18;
    v6->_index = objc_msgSend(v4, "index", v14, (_QWORD)v18);
    objc_msgSend(v4, "metadata");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "copy");
    metadata = v6->_metadata;
    v6->_metadata = (NSDictionary *)v9;

    if (v4)
    {
      objc_msgSend(v4, "metadataTime");
    }
    else
    {
      v15 = 0uLL;
      v19 = 0;
    }
    *(_OWORD *)&v6->_metadataTime.value = v15;
    v6->_metadataTime.epoch = v19;
    v6->_colorBuffer = CVPixelBufferRetain((CVPixelBufferRef)objc_msgSend(v4, "colorBuffer", v15, v19));
    p_colorBufferTime = &v6->_colorBufferTime;
    if (v4)
    {
      objc_msgSend(v4, "colorBufferTime");
      *(_OWORD *)&p_colorBufferTime->value = v16;
      v6->_colorBufferTime.epoch = v18;
      objc_msgSend(v4, "colorBufferPreferredTransform");
    }
    else
    {
      p_colorBufferTime->value = 0;
      *(_QWORD *)&v6->_colorBufferTime.timescale = 0;
      v6->_colorBufferTime.epoch = 0;
      v18 = 0u;
      v20 = 0u;
      v16 = 0u;
    }
    *(_OWORD *)&v6->_colorBufferPreferredTransform.a = v16;
    *(_OWORD *)&v6->_colorBufferPreferredTransform.c = v18;
    *(_OWORD *)&v6->_colorBufferPreferredTransform.tx = v20;
    v6->_disparityBuffer = CVPixelBufferRetain((CVPixelBufferRef)objc_msgSend(v4, "disparityBuffer", v16, (_QWORD)v18));
    p_disparityBufferTime = &v6->_disparityBufferTime;
    if (v4)
    {
      objc_msgSend(v4, "disparityBufferTime");
      *(_OWORD *)&p_disparityBufferTime->value = v17;
      v6->_disparityBufferTime.epoch = v18;
      objc_msgSend(v4, "disparityBufferPreferredTransform");
    }
    else
    {
      p_disparityBufferTime->value = 0;
      *(_QWORD *)&v6->_disparityBufferTime.timescale = 0;
      v6->_disparityBufferTime.epoch = 0;
      v18 = 0u;
      v20 = 0u;
      v17 = 0u;
    }
    *(_OWORD *)&v6->_disparityBufferPreferredTransform.a = v17;
    *(_OWORD *)&v6->_disparityBufferPreferredTransform.c = v18;
    *(_OWORD *)&v6->_disparityBufferPreferredTransform.tx = v20;
  }

  return v6;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)time
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[2];
  return self;
}

- (void)setTime:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_time.epoch = a3->var3;
  *(_OWORD *)&self->_time.value = v3;
}

- (unint64_t)index
{
  return self->_index;
}

- (void)setIndex:(unint64_t)a3
{
  self->_index = a3;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_metadata, a3);
}

- (void)setJsonFriendlyMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_jsonFriendlyMetadata, a3);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)metadataTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[3];
  return self;
}

- (void)setMetadataTime:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_metadataTime.epoch = a3->var3;
  *(_OWORD *)&self->_metadataTime.value = v3;
}

- (__CVBuffer)colorBuffer
{
  return self->_colorBuffer;
}

- (void)setColorBuffer:(__CVBuffer *)a3
{
  self->_colorBuffer = a3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)colorBufferTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[4];
  return self;
}

- (void)setColorBufferTime:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_colorBufferTime.epoch = a3->var3;
  *(_OWORD *)&self->_colorBufferTime.value = v3;
}

- (CGAffineTransform)colorBufferPreferredTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[3].c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[3].a;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[3].tx;
  return self;
}

- (void)setColorBufferPreferredTransform:(CGAffineTransform *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->a;
  v4 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_colorBufferPreferredTransform.c = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_colorBufferPreferredTransform.tx = v4;
  *(_OWORD *)&self->_colorBufferPreferredTransform.a = v3;
}

- (__CVBuffer)disparityBuffer
{
  return self->_disparityBuffer;
}

- (void)setDisparityBuffer:(__CVBuffer *)a3
{
  self->_disparityBuffer = a3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)disparityBufferTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[5];
  return self;
}

- (void)setDisparityBufferTime:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_disparityBufferTime.epoch = a3->var3;
  *(_OWORD *)&self->_disparityBufferTime.value = v3;
}

- (CGAffineTransform)disparityBufferPreferredTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[4].c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[4].a;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[4].tx;
  return self;
}

- (void)setDisparityBufferPreferredTransform:(CGAffineTransform *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->a;
  v4 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_disparityBufferPreferredTransform.c = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_disparityBufferPreferredTransform.tx = v4;
  *(_OWORD *)&self->_disparityBufferPreferredTransform.a = v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_jsonFriendlyMetadata, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
}

@end
