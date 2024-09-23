@implementation VMUPeakFootprintAnalyzer

- (const)analyzerName
{
  return "PEAK FOOTPRINT";
}

- (id)analysisSummaryWithError:(id *)a3
{
  unint64_t v4;
  unint64_t v5;
  void *v6;
  VMUAnalyzerSummaryField *v7;
  VMUAnalyzerSummaryField *v8;
  float v9;
  void *v10;
  VMUAnalyzerSummaryField *v11;
  uint64_t v12;

  v4 = -[VMUProcessObjectGraph physicalFootprint](self->super._graph, "physicalFootprint", a3);
  v5 = -[VMUProcessObjectGraph physicalFootprintPeak](self->super._graph, "physicalFootprintPeak");
  v6 = (void *)objc_opt_new();
  v7 = -[VMUAnalyzerSummaryField initWithKey:numericalValue:objectValue:fieldType:]([VMUAnalyzerSummaryField alloc], "initWithKey:numericalValue:objectValue:fieldType:", CFSTR("Physical footprint"), v4, 0, 2);
  objc_msgSend(v6, "addObject:", v7);
  v8 = -[VMUAnalyzerSummaryField initWithKey:numericalValue:objectValue:fieldType:]([VMUAnalyzerSummaryField alloc], "initWithKey:numericalValue:objectValue:fieldType:", CFSTR("Physical footprint (peak)"), v5, 0, 2);

  objc_msgSend(v6, "addObject:", v8);
  v9 = (float)v5 / (float)v4;
  if (v9 > 1.25)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Peak physical footprint was %.2f times higher than current -- past memory use was much higher. This can be analyzed with the Allocations instrument"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = [VMUAnalyzerSummaryField alloc];
    v12 = -[VMUAnalyzerSummaryField initWithKey:numericalValue:objectValue:fieldType:](v11, "initWithKey:numericalValue:objectValue:fieldType:", kVMUAnalysisSummaryKey[0], 0, v10, 0);

    objc_msgSend(v6, "addObject:", v12);
    v8 = (VMUAnalyzerSummaryField *)v12;
  }

  return v6;
}

@end
