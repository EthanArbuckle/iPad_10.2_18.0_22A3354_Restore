@implementation _LTSpeechRecognitionSausage(Daemon)

- (id)initWithRecognition:()Daemon wordConfidenceThreshold:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  NSObject *v20;
  id v21;
  id v23;
  void *v24;
  _QWORD v25[5];
  objc_super v26;

  v6 = a3;
  v26.receiver = a1;
  v26.super_class = (Class)&off_257885138;
  v7 = objc_msgSendSuper2(&v26, sel_init);
  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "interpretationIndices");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "tokenSausage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v7;
    if (objc_msgSend(v11, "count"))
    {
      v12 = 0;
      while (1)
      {
        v13 = objc_msgSend(v10, "count", v23);

        if (v12 >= v13)
          break;
        objc_msgSend(v6, "tokenSausage");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectAtIndexedSubscript:", v12);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        v25[0] = MEMORY[0x24BDAC760];
        v25[1] = 3221225472;
        v25[2] = __83___LTSpeechRecognitionSausage_Daemon__initWithRecognition_wordConfidenceThreshold___block_invoke;
        v25[3] = &__block_descriptor_40_e56____LTSpeechRecognitionTokensAlternative_16__0__NSArray_8l;
        v25[4] = a4;
        objc_msgSend(v15, "_ltCompactMap:", v25);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectAtIndexedSubscript:", v12);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_alloc_init(MEMORY[0x24BDF6440]);
        objc_msgSend(v18, "setBestAlternativeIndex:", objc_msgSend(v17, "unsignedIntegerValue"));
        objc_msgSend(v18, "setAlternatives:", v16);
        objc_msgSend(v8, "addObject:", v18);

        ++v12;
        objc_msgSend(v6, "tokenSausage");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12 >= objc_msgSend(v11, "count"))
          goto LABEL_6;
      }
    }
    else
    {
LABEL_6:

    }
    objc_msgSend(v8, "_ltCompactMap:", &__block_literal_global_23, v23);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = _LTOSLogSpeech();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      -[_LTSpeechRecognitionSausage(Daemon) initWithRecognition:wordConfidenceThreshold:].cold.1(v20, v19);
    v7 = v24;
    objc_msgSend(v24, "setBins:", v8);
    v21 = v24;

  }
  return v7;
}

- (void)initWithRecognition:()Daemon wordConfidenceThreshold:.cold.1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(a2, "componentsJoinedByString:", CFSTR(","));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v4;
  _os_log_debug_impl(&dword_2491B9000, v3, OS_LOG_TYPE_DEBUG, "Sausage confidences: %@", (uint8_t *)&v5, 0xCu);

}

@end
