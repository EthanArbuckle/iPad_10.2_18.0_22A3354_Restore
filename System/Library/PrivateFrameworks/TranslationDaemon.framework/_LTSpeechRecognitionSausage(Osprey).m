@implementation _LTSpeechRecognitionSausage(Osprey)

- (id)initWithOspreySausage:()Osprey choices:locale:
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  NSObject *v26;
  id v27;
  id v29;
  _QWORD v30[4];
  id v31;
  objc_super v32;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v32.receiver = a1;
  v32.super_class = (Class)&off_257885138;
  v11 = objc_msgSendSuper2(&v32, sel_init);
  if (v11)
  {
    objc_msgSend(v9, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v29 = v9;
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "alternative_index");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v14, "count"))
      {
        v15 = 0;
        while (1)
        {
          objc_msgSend(v8, "positional_tok_phrase_alt");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "count");

          if (v15 >= v17)
            break;
          objc_msgSend(v8, "positional_tok_phrase_alt");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "objectAtIndexedSubscript:", v15);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v19, "tok_phrases");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v30[0] = MEMORY[0x24BDAC760];
          v30[1] = 3221225472;
          v30[2] = __76___LTSpeechRecognitionSausage_Osprey__initWithOspreySausage_choices_locale___block_invoke;
          v30[3] = &unk_251A13A40;
          v31 = v10;
          objc_msgSend(v20, "_ltCompactMap:", v30);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v12, "alternative_index");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "objectAtIndexedSubscript:", v15);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          v24 = objc_alloc_init(MEMORY[0x24BDF6440]);
          objc_msgSend(v24, "setBestAlternativeIndex:", objc_msgSend(v23, "unsignedIntegerValue"));
          objc_msgSend(v24, "setAlternatives:", v21);
          objc_msgSend(v13, "addObject:", v24);

          ++v15;
          objc_msgSend(v12, "alternative_index");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15 >= objc_msgSend(v14, "count"))
            goto LABEL_7;
        }
      }
      else
      {
LABEL_7:

      }
      objc_msgSend(v13, "_ltCompactMap:", &__block_literal_global_24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = _LTOSLogSpeech();
      v9 = v29;
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        -[_LTSpeechRecognitionSausage(Daemon) initWithRecognition:wordConfidenceThreshold:].cold.1(v26, v25);
      objc_msgSend(v11, "setBins:", v13);
      v27 = v11;

    }
    else
    {
      v27 = 0;
    }

  }
  else
  {
    v27 = 0;
  }

  return v27;
}

@end
