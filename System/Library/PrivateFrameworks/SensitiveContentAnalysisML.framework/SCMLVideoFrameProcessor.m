@implementation SCMLVideoFrameProcessor

- (SCMLVideoFrameProcessor)initWithImageAnalyzer:(id)a3
{
  id v5;
  SCMLVideoFrameProcessor *v6;
  SCMLVideoFrameProcessor *v7;
  uint64_t v8;
  NSMutableArray *frameQueue;
  uint64_t v10;
  SCMLVideoAnalysisConfiguration *config;
  SCMLVideoAnalysisResult *v12;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SCMLVideoFrameProcessor;
  v6 = -[SCMLVideoFrameProcessor init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_imageAnalyzer, a3);
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v8 = objc_claimAutoreleasedReturnValue();
    frameQueue = v7->_frameQueue;
    v7->_frameQueue = (NSMutableArray *)v8;

    +[SCMLVideoAnalysisConfiguration defaultConfig](SCMLVideoAnalysisConfiguration, "defaultConfig");
    v10 = objc_claimAutoreleasedReturnValue();
    config = v7->_config;
    v7->_config = (SCMLVideoAnalysisConfiguration *)v10;

    v12 = v7->_result;
    v7->_result = 0;

    v7->_frameCount = 0;
    v7->_sensitiveFrameCount = 0;
  }

  return v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[SCMLVideoFrameProcessor frameQueue](self, "frameQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  v4.receiver = self;
  v4.super_class = (Class)SCMLVideoFrameProcessor;
  -[SCMLVideoFrameProcessor dealloc](&v4, sel_dealloc);
}

- (void)reset
{
  void *v3;

  -[SCMLVideoFrameProcessor frameQueue](self, "frameQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  -[SCMLVideoFrameProcessor setFrameCount:](self, "setFrameCount:", 0);
  -[SCMLVideoFrameProcessor setSensitiveFrameCount:](self, "setSensitiveFrameCount:", 0);
  -[SCMLVideoFrameProcessor setResult:](self, "setResult:", 0);
}

- (id)popFrame
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[SCMLVideoFrameProcessor frameQueue](self, "frameQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "count");

  if (v4)
  {
    -[SCMLVideoFrameProcessor frameQueue](self, "frameQueue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    -[SCMLVideoFrameProcessor frameQueue](self, "frameQueue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObjectAtIndex:", 0);

  }
  return v4;
}

- (void)pushFrame:(id)a3
{
  id v4;

  v4 = a3;
  -[NSMutableArray addObject:](self->_frameQueue, "addObject:");
  -[SCMLVideoFrameProcessor setFrameCount:](self, "setFrameCount:", -[SCMLVideoFrameProcessor frameCount](self, "frameCount") + 1);

}

- (void)startAnalysisWithConfig:(id)a3
{
  uint64_t v4;
  id v5;
  id v6;

  v5 = a3;
  -[SCMLVideoFrameProcessor reset](self, "reset");
  v4 = (uint64_t)v5;
  if (!v5)
  {
    +[SCMLVideoAnalysisConfiguration defaultConfig](SCMLVideoAnalysisConfiguration, "defaultConfig");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (id)v4;
  -[SCMLVideoFrameProcessor setConfig:](self, "setConfig:");

}

- (BOOL)addFrameBuffer:(opaqueCMSampleBuffer *)a3
{
  SCMLVideoFrame *v5;

  if (a3)
  {
    v5 = -[SCMLVideoFrame initWithFrameBuffer:frameIndex:]([SCMLVideoFrame alloc], "initWithFrameBuffer:frameIndex:", a3, -[SCMLVideoFrameProcessor frameCount](self, "frameCount"));
    -[SCMLVideoFrameProcessor pushFrame:](self, "pushFrame:", v5);

  }
  return a3 != 0;
}

- (void)outputDebugInfoForFrame:(id)a3 isSensitive:(BOOL)a4 sensitivityScore:(id)a5
{
  _BOOL4 v6;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  const char *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  const char *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  const char *v26;
  id v27;
  uint8_t buf[4];
  NSObject *v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v6 = a4;
  v34 = *MEMORY[0x24BDAC8D0];
  v27 = a3;
  v8 = a5;
  +[SCMLLog videoAnalyzer](SCMLLog, "videoAnalyzer");
  v9 = objc_claimAutoreleasedReturnValue();
  -[SCMLVideoFrameProcessor config](self, "config");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "debugFramesOutputPathPrefix");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v27, "metaDataInfo");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v9;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v8, "doubleValue");
      if (v6)
        v15 = "Y";
      else
        v15 = "N";
      *(_DWORD *)buf = 138412802;
      v29 = v12;
      v30 = 2080;
      v31 = v15;
      v32 = 2048;
      v33 = v14;
      _os_log_impl(&dword_245BFA000, v13, OS_LOG_TYPE_INFO, "Frame %@ sensitive=%s score=%.4f", buf, 0x20u);
    }

    v16 = v8;
    v17 = (void *)MEMORY[0x24BDD17C8];
    -[SCMLVideoFrameProcessor config](self, "config");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "debugFramesOutputPathPrefix");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "doubleValue");
    if (v6)
      v21 = "Y";
    else
      v21 = "N";
    objc_msgSend(v17, "stringWithFormat:", CFSTR("%@%@-%s-%.4f.png"), v19, v12, v21, v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = v16;
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initFileURLWithPath:isDirectory:", v22, 0);
    objc_msgSend(v27, "saveToPngWithUrl:", v23);

LABEL_13:
    goto LABEL_14;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v12 = v9;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v27, "metaDataInfo");
      v24 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "doubleValue");
      v26 = "N";
      *(_DWORD *)buf = 138412802;
      v29 = v24;
      if (v6)
        v26 = "Y";
      v30 = 2080;
      v31 = v26;
      v32 = 2048;
      v33 = v25;
      _os_log_debug_impl(&dword_245BFA000, v12, OS_LOG_TYPE_DEBUG, "Frame %@ sensitive=%s score=%.4f", buf, 0x20u);

    }
    goto LABEL_13;
  }
LABEL_14:

}

- (id)analyze:(id *)a3
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  SCMLVideoFrameProcessor *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  CVImageBufferRef ImageBuffer;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  uint64_t v28;
  void *v29;
  void *v30;
  SCMLVideoAnalysisResult *v31;
  unint64_t v32;
  void *v33;
  SCMLVideoAnalysisResult *v34;
  void *v37;
  void *v38;
  void *v39;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  id v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  -[SCMLVideoFrameProcessor result](self, "result");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "sensitive");

  -[SCMLVideoFrameProcessor result](self, "result");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if ((v4 & 1) == 0)
  {
    objc_msgSend(v5, "sensitivityScore");
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = self;
    -[SCMLVideoFrameProcessor result](self, "result");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "scoresForLabels");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "mutableCopy");

    if (!v10)
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v11 = 0;
    while (1)
    {
      v12 = -[SCMLVideoFrameProcessor sensitiveFrameCount](v7, "sensitiveFrameCount");
      -[SCMLVideoFrameProcessor config](v7, "config");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12 >= objc_msgSend(v13, "sensitiveFrameCountThreshold"))
      {

        v39 = v11;
        goto LABEL_25;
      }
      -[SCMLVideoFrameProcessor popFrame](v7, "popFrame");
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v38)
        break;
      ImageBuffer = CMSampleBufferGetImageBuffer((CMSampleBufferRef)objc_msgSend(v38, "frameBuffer"));
      -[SCMLVideoFrameProcessor imageAnalyzer](self, "imageAnalyzer");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "generateClassificationScoresForPixelBuffer:error:", ImageBuffer, a3);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      -[SCMLVideoFrameProcessor imageAnalyzer](self, "imageAnalyzer");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = &unk_2516EB880;
      v18 = objc_msgSend(v17, "isSensitive:sensitivityScore:classificationMode:", v16, &v45, 0);
      v19 = v45;

      -[SCMLVideoFrameProcessor outputDebugInfoForFrame:isSensitive:sensitivityScore:](self, "outputDebugInfoForFrame:isSensitive:sensitivityScore:", v38, v18, v19);
      if ((_DWORD)v18)
        -[SCMLVideoFrameProcessor setSensitiveFrameCount:](self, "setSensitiveFrameCount:", -[SCMLVideoFrameProcessor sensitiveFrameCount](self, "sensitiveFrameCount") + 1);
      v20 = v37;
      if (!v37 || (v20 = v37, objc_msgSend(v19, "compare:", v37) == 1))
      {
        v21 = v19;

        v37 = v21;
      }
      objc_msgSend(v16, "objectForKeyedSubscript:", SCMLHandlerImageClassificationScores[0]);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      +[SCMLAnalysisResult obfuscateLabels:](SCMLAnalysisResult, "obfuscateLabels:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      v43 = 0u;
      v44 = 0u;
      v41 = 0u;
      v42 = 0u;
      v24 = v23;
      v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
      if (v25)
      {
        v26 = *(_QWORD *)v42;
        do
        {
          for (i = 0; i != v25; ++i)
          {
            if (*(_QWORD *)v42 != v26)
              objc_enumerationMutation(v24);
            v28 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * i);
            objc_msgSend(v24, "objectForKeyedSubscript:", v28);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "objectForKeyedSubscript:", v28);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v30 || objc_msgSend(v29, "compare:", v30) == 1)
              objc_msgSend(v10, "setObject:forKeyedSubscript:", v29, v28);

          }
          v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
        }
        while (v25);
      }

      v11 = v38;
      v7 = self;
    }
    v39 = 0;
LABEL_25:
    v31 = [SCMLVideoAnalysisResult alloc];
    v32 = -[SCMLVideoFrameProcessor sensitiveFrameCount](self, "sensitiveFrameCount");
    -[SCMLVideoFrameProcessor config](self, "config");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = -[SCMLAnalysisResult initWithSensitive:sensitivityScore:scoresForLabels:](v31, "initWithSensitive:sensitivityScore:scoresForLabels:", v32 >= objc_msgSend(v33, "sensitiveFrameCountThreshold"), v37, v10);
    -[SCMLVideoFrameProcessor setResult:](self, "setResult:", v34);

    -[SCMLVideoFrameProcessor result](self, "result");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (id)finalizeAnalysis:(id *)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  SCMLVideoAnalysisResult *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;

  -[SCMLVideoFrameProcessor result](self, "result", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[SCMLVideoFrameProcessor result](self, "result");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "sensitive");

    v7 = -[SCMLVideoFrameProcessor frameCount](self, "frameCount");
    -[SCMLVideoFrameProcessor config](self, "config");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "sensitiveFrameCountThreshold");

    if (v7 < v9)
    {
      v10 = -[SCMLVideoFrameProcessor frameCount](self, "frameCount");
      v6 = v10 == -[SCMLVideoFrameProcessor sensitiveFrameCount](self, "sensitiveFrameCount");
    }
    v11 = [SCMLVideoAnalysisResult alloc];
    -[SCMLVideoFrameProcessor result](self, "result");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "sensitivityScore");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCMLVideoFrameProcessor result](self, "result");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "scoresForLabels");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[SCMLAnalysisResult initWithSensitive:sensitivityScore:scoresForLabels:](v11, "initWithSensitive:sensitivityScore:scoresForLabels:", v6, v13, v15);

    v17 = (void *)v16;
  }
  else
  {
    v17 = 0;
  }
  -[SCMLVideoFrameProcessor reset](self, "reset");
  return v17;
}

- (SCMLImageAnalyzer)imageAnalyzer
{
  return self->_imageAnalyzer;
}

- (void)setImageAnalyzer:(id)a3
{
  objc_storeStrong((id *)&self->_imageAnalyzer, a3);
}

- (NSMutableArray)frameQueue
{
  return self->_frameQueue;
}

- (void)setFrameQueue:(id)a3
{
  objc_storeStrong((id *)&self->_frameQueue, a3);
}

- (unint64_t)frameCount
{
  return self->_frameCount;
}

- (void)setFrameCount:(unint64_t)a3
{
  self->_frameCount = a3;
}

- (unint64_t)sensitiveFrameCount
{
  return self->_sensitiveFrameCount;
}

- (void)setSensitiveFrameCount:(unint64_t)a3
{
  self->_sensitiveFrameCount = a3;
}

- (SCMLVideoAnalysisResult)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
  objc_storeStrong((id *)&self->_result, a3);
}

- (SCMLVideoAnalysisConfiguration)config
{
  return self->_config;
}

- (void)setConfig:(id)a3
{
  objc_storeStrong((id *)&self->_config, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_frameQueue, 0);
  objc_storeStrong((id *)&self->_imageAnalyzer, 0);
}

@end
