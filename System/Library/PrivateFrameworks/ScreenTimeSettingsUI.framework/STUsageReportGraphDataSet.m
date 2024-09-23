@implementation STUsageReportGraphDataSet

- (STUsageReportGraphDataSet)initWithTimePeriod:(unint64_t)a3 itemType:(unint64_t)a4 total:(id)a5 max:(id)a6 average:(id)a7 averageAsPercentageOfMax:(double)a8 dataPoints:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  STUsageReportGraphDataSet *v20;
  STUsageReportGraphDataSet *v21;
  uint64_t v22;
  NSNumber *total;
  uint64_t v24;
  NSNumber *max;
  uint64_t v26;
  NSNumber *average;
  uint64_t v28;
  NSArray *dataPoints;
  objc_super v31;

  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a9;
  v31.receiver = self;
  v31.super_class = (Class)STUsageReportGraphDataSet;
  v20 = -[STUsageReportGraphDataSet init](&v31, sel_init);
  v21 = v20;
  if (v20)
  {
    v20->_timePeriod = a3;
    v20->_itemType = a4;
    v22 = objc_msgSend(v16, "copy");
    total = v21->_total;
    v21->_total = (NSNumber *)v22;

    v24 = objc_msgSend(v17, "copy");
    max = v21->_max;
    v21->_max = (NSNumber *)v24;

    v26 = objc_msgSend(v18, "copy");
    average = v21->_average;
    v21->_average = (NSNumber *)v26;

    v21->_averageAsPercentageOfMax = a8;
    v28 = objc_msgSend(v19, "copy");
    dataPoints = v21->_dataPoints;
    v21->_dataPoints = (NSArray *)v28;

  }
  return v21;
}

- (id)initEmptyDataSetWithTimePeriod:(unint64_t)a3 referenceDate:(id)a4
{
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  STUsageReportGraphDataSet *v23;
  _QWORD v25[4];
  id v26;
  id v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;

  v7 = a4;
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__8;
  v35 = __Block_byref_object_dispose__8;
  objc_msgSend(v8, "startOfDayForDate:", v7);
  v36 = (id)objc_claimAutoreleasedReturnValue();
  if (!a3)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUsageReportGraphDataSet.m"), 66, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("NO"));

    v14 = 0;
    v12 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_10:
    v18 = 16;
    v17 = 1;
    goto LABEL_11;
  }
  if (a3 != 1)
  {
    if (a3 == 2)
    {
      v9 = objc_msgSend(v8, "firstWeekday");
      if (objc_msgSend(v8, "component:fromDate:", 512, v32[5]) != v9)
      {
        objc_msgSend(v8, "nextDateAfterDate:matchingUnit:value:options:", v32[5], 512, v9, 516);
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = (void *)v32[5];
        v32[5] = v10;

      }
      v12 = objc_msgSend(v8, "rangeOfUnit:inUnit:forDate:", 512, 0x2000, v7);
      v14 = v13;
    }
    else
    {
      v14 = 0;
      v12 = 0;
    }
    goto LABEL_10;
  }
  v12 = objc_msgSend(v8, "rangeOfUnit:inUnit:forDate:", 32, 16, v7);
  v14 = v16;
  v17 = 0;
  v18 = 32;
LABEL_11:
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", v14);
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD15E0]), "initWithIndexesInRange:", v12, v14);
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __74__STUsageReportGraphDataSet_initEmptyDataSetWithTimePeriod_referenceDate___block_invoke;
  v25[3] = &unk_24DB88800;
  v21 = v8;
  v26 = v21;
  v28 = &v31;
  v29 = v18;
  v30 = v17;
  v22 = v19;
  v27 = v22;
  objc_msgSend(v20, "enumerateIndexesUsingBlock:", v25);
  v23 = -[STUsageReportGraphDataSet initWithTimePeriod:itemType:total:max:average:averageAsPercentageOfMax:dataPoints:](self, "initWithTimePeriod:itemType:total:max:average:averageAsPercentageOfMax:dataPoints:", a3, 1, &unk_24DBBEE38, &unk_24DBBEE38, &unk_24DBBEE38, v22, 0.0);

  _Block_object_dispose(&v31, 8);
  return v23;
}

void __74__STUsageReportGraphDataSet_initEmptyDataSetWithTimePeriod_referenceDate___block_invoke(uint64_t a1)
{
  uint64_t v2;
  STUsageReportGraphDataPoint *v3;
  STUsageReportGraphDataPoint *v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "dateByAddingUnit:value:toDate:options:", *(_QWORD *)(a1 + 56), 1, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:endDate:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v2);
  v3 = [STUsageReportGraphDataPoint alloc];
  v4 = -[STUsageReportGraphDataPoint initWithTimePeriod:itemType:dateInterval:total:totalAsPercentageOfMax:segments:](v3, "initWithTimePeriod:itemType:dateInterval:total:totalAsPercentageOfMax:segments:", *(_QWORD *)(a1 + 64), 1, v7, &unk_24DBBEE38, MEMORY[0x24BDBD1A8], 0.0);
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v4);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v2;

}

- (unint64_t)timePeriod
{
  return self->_timePeriod;
}

- (void)setTimePeriod:(unint64_t)a3
{
  self->_timePeriod = a3;
}

- (unint64_t)itemType
{
  return self->_itemType;
}

- (void)setItemType:(unint64_t)a3
{
  self->_itemType = a3;
}

- (NSNumber)total
{
  return self->_total;
}

- (void)setTotal:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSNumber)max
{
  return self->_max;
}

- (void)setMax:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSNumber)average
{
  return self->_average;
}

- (void)setAverage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (double)averageAsPercentageOfMax
{
  return self->_averageAsPercentageOfMax;
}

- (void)setAverageAsPercentageOfMax:(double)a3
{
  self->_averageAsPercentageOfMax = a3;
}

- (NSArray)dataPoints
{
  return self->_dataPoints;
}

- (void)setDataPoints:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataPoints, 0);
  objc_storeStrong((id *)&self->_average, 0);
  objc_storeStrong((id *)&self->_max, 0);
  objc_storeStrong((id *)&self->_total, 0);
}

@end
