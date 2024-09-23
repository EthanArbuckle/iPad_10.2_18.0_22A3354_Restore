@implementation TISCTextRunResponse

- (__CFArray)ctLines
{
  return self->_ctLines;
}

- (id)widths
{
  return self->_widths;
}

- (__CTFont)font
{
  return self->_font;
}

- (void)dealloc
{
  objc_super v3;

  CFRelease(self->_ctLines);
  CFRelease(self->_font);
  v3.receiver = self;
  v3.super_class = (Class)TISCTextRunResponse;
  -[TISCTextRunResponse dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widths, 0);
}

+ (id)textRunResponseWithFont:(__CTFont *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;

  v4 = (_QWORD *)objc_opt_new();
  v4[1] = CFArrayCreateMutable(0, 0, MEMORY[0x1E0C9B378]);
  v5 = objc_opt_new();
  v6 = (void *)v4[2];
  v4[2] = v5;

  v4[3] = CFRetain(a3);
  return v4;
}

+ (id)textRunResponseByMergingResponses:(id)a3
{
  id v3;
  _QWORD *v4;
  void *v5;
  CFIndex Count;
  void *v7;
  CFIndex i;
  __CFArray *Mutable;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const __CTLine *ValueAtIndex;
  const __CFArray *GlyphRuns;
  const __CTLine *v18;
  void *v19;
  void *v20;
  void *v21;
  __CFArray *theArray;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;
  CFRange v30;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "count") == 1)
  {
    objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
    v4 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v3, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    Count = CFArrayGetCount((CFArrayRef)objc_msgSend(v5, "ctLines"));

    theArray = CFArrayCreateMutable(0, Count, MEMORY[0x1E0C9B378]);
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", Count);
    if (Count)
    {
      for (i = 0; i != Count; ++i)
      {
        Mutable = CFArrayCreateMutable(0, Count, MEMORY[0x1E0C9B378]);
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        v10 = v3;
        v11 = v3;
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v25;
          do
          {
            v15 = 0;
            do
            {
              if (*(_QWORD *)v25 != v14)
                objc_enumerationMutation(v11);
              ValueAtIndex = (const __CTLine *)CFArrayGetValueAtIndex((CFArrayRef)objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v15), "ctLines"), i);
              GlyphRuns = CTLineGetGlyphRuns(ValueAtIndex);
              v30.length = CFArrayGetCount(GlyphRuns);
              v30.location = 0;
              CFArrayAppendArray(Mutable, GlyphRuns, v30);
              ++v15;
            }
            while (v13 != v15);
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
          }
          while (v13);
        }

        v18 = (const __CTLine *)CTLineCreateWithRunArray();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", CTLineGetTypographicBounds(v18, 0, 0, 0));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v19);

        CFArrayAppendValue(theArray, v18);
        CFRelease(v18);
        CFRelease(Mutable);
        v3 = v10;
      }
    }
    v4 = (_QWORD *)objc_opt_new();
    v20 = (void *)v4[2];
    v4[1] = theArray;
    v4[2] = v7;

    objc_msgSend(v3, "firstObject");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v4[3] = CFRetain((CFTypeRef)objc_msgSend(v21, "font"));

  }
  return v4;
}

@end
