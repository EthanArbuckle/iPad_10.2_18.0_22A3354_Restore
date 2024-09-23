@implementation RTMotionActivityHistogram

- (RTMotionActivityHistogram)init
{
  RTMotionActivityHistogram *v2;
  uint64_t v3;
  NSMutableDictionary *bins;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RTMotionActivityHistogram;
  v2 = -[RTMotionActivityHistogram init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    bins = v2->_bins;
    v2->_bins = (NSMutableDictionary *)v3;

    v2->_totalInterval = 0.0;
  }
  return v2;
}

- (RTMotionActivityHistogram)initWithActivites:(id)a3 betweenDate:(id)a4 andDate:(id)a5
{
  id v8;
  id v9;
  id v10;
  RTMotionActivityHistogram *v11;
  uint64_t v12;
  NSMutableDictionary *bins;
  _QWORD v15[4];
  id v16;
  RTMotionActivityHistogram *v17;
  _QWORD *v18;
  _QWORD v19[5];
  id v20;
  objc_super v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)RTMotionActivityHistogram;
  v11 = -[RTMotionActivityHistogram init](&v21, sel_init);
  if (v11)
  {
    v12 = objc_opt_new();
    bins = v11->_bins;
    v11->_bins = (NSMutableDictionary *)v12;

    v11->_totalInterval = 0.0;
    v19[0] = 0;
    v19[1] = v19;
    v19[2] = 0x3032000000;
    v19[3] = __Block_byref_object_copy__76;
    v19[4] = __Block_byref_object_dispose__76;
    v20 = v10;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __67__RTMotionActivityHistogram_initWithActivites_betweenDate_andDate___block_invoke;
    v15[3] = &unk_1E929ED00;
    v18 = v19;
    v16 = v9;
    v17 = v11;
    objc_msgSend(v8, "enumerateObjectsWithOptions:usingBlock:", 2, v15);

    _Block_object_dispose(v19, 8);
  }

  return v11;
}

void __67__RTMotionActivityHistogram_initWithActivites_betweenDate_andDate___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;

  v18 = a2;
  objc_msgSend(v18, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "laterDate:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "startDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 != v8)
  {
    objc_msgSend(v18, "startDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "earlierDate:", *(_QWORD *)(a1 + 32));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "startDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10 == v11)
    {
      v12 = *(id *)(a1 + 32);
      *a4 = 1;
    }
    else
    {
      objc_msgSend(v18, "startDate");
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    v13 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "timeIntervalSinceDate:", v12);
    objc_msgSend(v13, "addInterval:ofType:withConfidence:", objc_msgSend(v18, "type"), objc_msgSend(v18, "confidence"), v14);
    objc_msgSend(v18, "startDate");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v17 = *(void **)(v16 + 40);
    *(_QWORD *)(v16 + 40) = v15;

  }
}

- (id)binForType:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[RTMotionActivityHistogram bins](self, "bins");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  return v7;
}

- (void)addInterval:(double)a3 ofType:(unint64_t)a4 withConfidence:(unint64_t)a5
{
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  RTMotionActivityHistogramBin *v14;

  -[RTMotionActivityHistogram bins](self, "bins");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", v10);
  v14 = (RTMotionActivityHistogramBin *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[RTMotionActivityHistogramBin addInterval:](v14, "addInterval:", a3);
    -[RTMotionActivityHistogramBin updateConfidence:](v14, "updateConfidence:", a5);
  }
  else
  {
    v14 = -[RTMotionActivityHistogramBin initWithType:confidence:interval:]([RTMotionActivityHistogramBin alloc], "initWithType:confidence:interval:", a4, a5, a3);
    -[RTMotionActivityHistogram bins](self, "bins");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v14, v12);

  }
  -[RTMotionActivityHistogram totalInterval](self, "totalInterval");
  -[RTMotionActivityHistogram setTotalInterval:](self, "setTotalInterval:", v13 + a3);

}

- (id)binsSortedByInterval
{
  void *v2;
  void *v3;
  void *v4;

  -[RTMotionActivityHistogram bins](self, "bins");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sortedArrayUsingComparator:", &__block_literal_global_62);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __49__RTMotionActivityHistogram_binsSortedByInterval__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v4 = a3;
  objc_msgSend(a2, "interval");
  v6 = v5;
  objc_msgSend(v4, "interval");
  v8 = v7;

  if (v6 <= v8)
    return 1;
  else
    return -1;
}

- (NSMutableDictionary)bins
{
  return self->_bins;
}

- (double)totalInterval
{
  return self->_totalInterval;
}

- (void)setTotalInterval:(double)a3
{
  self->_totalInterval = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bins, 0);
}

@end
