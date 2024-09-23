@implementation _PXVideoStabilizeResult

- (NSDictionary)dictionaryRepresentation
{
  uint64_t v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v28;
  void *v29;
  id v30;
  CMTimeRange range;
  CMTime time;
  const __CFString *v33;
  void *v34;
  _QWORD v35[3];
  _QWORD v36[3];
  _QWORD v37[4];
  _QWORD v38[6];

  v38[4] = *MEMORY[0x1E0C80C00];
  v30 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v37[0] = CFSTR("Device Type");
  v3 = MGCopyAnswer();
  v4 = (void *)v3;
  v5 = CFSTR("Unknown");
  if (v3)
    v5 = (const __CFString *)v3;
  v38[0] = v5;
  v37[1] = CFSTR("Video URL");
  -[_PXVideoStabilizeResult spec](self, "spec");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "inputVideoURL");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v38[1] = v6;
  v37[2] = CFSTR("Start Time");
  -[_PXVideoStabilizeResult spec](self, "spec");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
    objc_msgSend(v7, "startTime");
  else
    memset(&time, 0, sizeof(time));
  v9 = (__CFString *)CMTimeCopyDescription(0, &time);
  v38[2] = v9;
  v37[3] = CFSTR("Trim Range");
  -[_PXVideoStabilizeResult spec](self, "spec");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
    objc_msgSend(v10, "timeRange");
  else
    memset(&range, 0, sizeof(range));
  v12 = (__CFString *)CMTimeRangeCopyDescription(0, &range);
  v38[3] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setObject:forKeyedSubscript:", v13, CFSTR("input"));

  v35[0] = CFSTR("Error");
  -[_PXVideoStabilizeResult error](self, "error");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "description");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  v17 = CFSTR("None");
  if (v15)
    v17 = (const __CFString *)v15;
  v36[0] = v17;
  v35[1] = CFSTR("Analysis Type");
  PXVideoStabilizeAnalysisTypeDescription(-[_PXVideoStabilizeResult analysisType](self, "analysisType"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v36[1] = v18;
  v35[2] = CFSTR("Recipe Source Info");
  -[_PXVideoStabilizeResult debugInfo](self, "debugInfo");
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = (void *)v19;
  v21 = MEMORY[0x1E0C9AA70];
  if (v19)
    v21 = v19;
  v36[2] = v21;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 3);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setObject:forKeyedSubscript:", v22, CFSTR("output"));

  -[_PXVideoStabilizeResult stabilizationRecipe](self, "stabilizationRecipe");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    v33 = CFSTR("InertiaCam Output");
    -[_PXVideoStabilizeResult stabilizationRecipe](self, "stabilizationRecipe");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v24;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setObject:forKeyedSubscript:", v25, CFSTR("recipe"));

  }
  v26 = (void *)objc_msgSend(v30, "copy");

  return (NSDictionary *)v26;
}

- (AVAudioMix)outputAudioMix
{
  return self->_outputAudioMix;
}

- (void)setOutputAudioMix:(id)a3
{
  objc_storeStrong((id *)&self->_outputAudioMix, a3);
}

- (AVAsset)outputVideoAsset
{
  return self->_outputVideoAsset;
}

- (void)setOutputVideoAsset:(id)a3
{
  objc_storeStrong((id *)&self->_outputVideoAsset, a3);
}

- (AVVideoComposition)outputVideoComposition
{
  return self->_outputVideoComposition;
}

- (void)setOutputVideoComposition:(id)a3
{
  objc_storeStrong((id *)&self->_outputVideoComposition, a3);
}

- (PXVideoStabilizeOperationSpec)spec
{
  return self->_spec;
}

- (void)setSpec:(id)a3
{
  objc_storeStrong((id *)&self->_spec, a3);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (unint64_t)analysisType
{
  return self->_analysisType;
}

- (void)setAnalysisType:(unint64_t)a3
{
  self->_analysisType = a3;
}

- (NSDictionary)stabilizationRecipe
{
  return self->_stabilizationRecipe;
}

- (void)setStabilizationRecipe:(id)a3
{
  objc_storeStrong((id *)&self->_stabilizationRecipe, a3);
}

- (NSDictionary)debugInfo
{
  return self->_debugInfo;
}

- (void)setDebugInfo:(id)a3
{
  objc_storeStrong((id *)&self->_debugInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugInfo, 0);
  objc_storeStrong((id *)&self->_stabilizationRecipe, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_spec, 0);
  objc_storeStrong((id *)&self->_outputVideoComposition, 0);
  objc_storeStrong((id *)&self->_outputVideoAsset, 0);
  objc_storeStrong((id *)&self->_outputAudioMix, 0);
}

@end
