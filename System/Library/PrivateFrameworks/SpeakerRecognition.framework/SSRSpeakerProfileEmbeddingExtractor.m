@implementation SSRSpeakerProfileEmbeddingExtractor

+ (void)extractPSRVoiceProfileWithContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    if (v6)
    {
      objc_msgSend(v6, "modelsContext");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[SSRUtils stringForSpeakerRecognizerType:](SSRUtils, "stringForSpeakerRecognizerType:", 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __84__SSRSpeakerProfileEmbeddingExtractor_extractPSRVoiceProfileWithContext_completion___block_invoke;
      v12[3] = &unk_24CC84A30;
      v13 = v7;
      objc_msgSend(a1, "_extractWithModelContext:completion:", v10, v12);

    }
    else
    {
      v11 = *MEMORY[0x24BE284B8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v15 = "+[SSRSpeakerProfileEmbeddingExtractor extractPSRVoiceProfileWithContext:completion:]";
        _os_log_error_impl(&dword_2117D4000, v11, OS_LOG_TYPE_ERROR, "%s cannot extract profile embedding : context is nil", buf, 0xCu);
      }
      (*((void (**)(id, _QWORD, _QWORD, _QWORD, uint64_t, _QWORD))v7 + 2))(v7, 0, 0, 0, 1, 0);
    }
  }

}

+ (void)extractSATVoiceProfileWithContext:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    if (v6)
    {
      objc_msgSend(v6, "modelsContext");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[SSRUtils stringForSpeakerRecognizerType:](SSRUtils, "stringForSpeakerRecognizerType:", 2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __84__SSRSpeakerProfileEmbeddingExtractor_extractSATVoiceProfileWithContext_completion___block_invoke;
      v12[3] = &unk_24CC84A30;
      v13 = v7;
      objc_msgSend(a1, "_extractWithModelContext:completion:", v10, v12);

    }
    else
    {
      v11 = *MEMORY[0x24BE284B8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v15 = "+[SSRSpeakerProfileEmbeddingExtractor extractSATVoiceProfileWithContext:completion:]";
        _os_log_error_impl(&dword_2117D4000, v11, OS_LOG_TYPE_ERROR, "%s cannot extract profile embedding : context is nil", buf, 0xCu);
      }
      (*((void (**)(id, _QWORD, _QWORD, _QWORD, uint64_t, _QWORD))v7 + 2))(v7, 0, 0, 0, 2, 0);
    }
  }

}

+ (void)_extractWithModelContext:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void (**v20)(void);
  _QWORD v21[8];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  _QWORD v32[3];
  int v33;
  _QWORD v34[3];
  int v35;
  uint8_t v36[128];
  __int128 buf;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v19 = v6;
  v20 = (void (**)(void))a4;
  if (v6)
  {
    objc_msgSend(v6, "voiceProfilesModelFilePathsExclave");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v7;
    v8 = v7;
    if (v7 && objc_msgSend(v7, "count"))
    {
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v38 = 0x3032000000;
      v39 = __Block_byref_object_copy__914;
      v40 = __Block_byref_object_dispose__915;
      v41 = 0;
      v34[0] = 0;
      v34[1] = v34;
      v34[2] = 0x2020000000;
      v35 = 0;
      v32[0] = 0;
      v32[1] = v32;
      v32[2] = 0x2020000000;
      v33 = 0;
      v26 = 0;
      v27 = &v26;
      v28 = 0x3032000000;
      v29 = __Block_byref_object_copy__914;
      v30 = __Block_byref_object_dispose__915;
      v31 = 0;
      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      objc_msgSend(v8, "allValues");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v36, 16);
      if (v10)
      {
        v11 = *(_QWORD *)v23;
LABEL_6:
        v12 = 0;
        while (1)
        {
          if (*(_QWORD *)v23 != v11)
            objc_enumerationMutation(v9);
          v13 = (void *)MEMORY[0x24BDBCF48];
          objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v12), "path");
          v14 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "fileURLWithPath:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          v21[0] = MEMORY[0x24BDAC760];
          v21[1] = 3221225472;
          v21[2] = __75__SSRSpeakerProfileEmbeddingExtractor__extractWithModelContext_completion___block_invoke;
          v21[3] = &unk_24CC84A58;
          v21[4] = &buf;
          v21[5] = v34;
          v21[6] = v32;
          v21[7] = &v26;
          objc_msgSend(a1, "extractProfileData:completion:", v15, v21);
          LOBYTE(v14) = v27[5] == 0;

          if ((v14 & 1) != 0)
            break;
          if (v10 == ++v12)
          {
            v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v36, 16);
            if (v10)
              goto LABEL_6;
            break;
          }
        }
      }

      if (v20)
        v20[2]();
      _Block_object_dispose(&v26, 8);

      _Block_object_dispose(v32, 8);
      _Block_object_dispose(v34, 8);
      _Block_object_dispose(&buf, 8);

    }
    else
    {
      v16 = *MEMORY[0x24BE284B8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 136315138;
        *(_QWORD *)((char *)&buf + 4) = "+[SSRSpeakerProfileEmbeddingExtractor _extractWithModelContext:completion:]";
        _os_log_error_impl(&dword_2117D4000, v16, OS_LOG_TYPE_ERROR, "%s cannot extract profile embedding : modelContext = nil", (uint8_t *)&buf, 0xCu);
      }
      ((void (*)(void (**)(void), _QWORD, _QWORD, _QWORD, _QWORD))v20[2])(v20, 0, 0, 0, 0);
    }

  }
  else
  {
    v17 = *MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 136315138;
      *(_QWORD *)((char *)&buf + 4) = "+[SSRSpeakerProfileEmbeddingExtractor _extractWithModelContext:completion:]";
      _os_log_error_impl(&dword_2117D4000, v17, OS_LOG_TYPE_ERROR, "%s cannot extract profile embedding : model context is nil", (uint8_t *)&buf, 0xCu);
    }
    ((void (*)(void (**)(void), _QWORD, _QWORD, _QWORD, _QWORD))v20[2])(v20, 0, 0, 0, 0);
  }

}

+ (void)extractProfileData:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  os_log_t *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t i;
  int v16;
  int v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  void *v21;
  os_log_t v22;
  NSObject *v23;
  NSObject *v24;
  id v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  NSObject *v30;
  NSObject *v31;
  NSObject *v32;
  uint64_t v33;
  NSObject *v34;
  NSObject *v35;
  void *v36;
  int v37;
  int v38;
  unsigned int v39;
  unsigned int v40;
  int v41;
  unsigned int v42;
  unsigned int v43;
  unsigned int v44;
  int v45;
  int v46;
  uint8_t buf[4];
  const char *v48;
  __int16 v49;
  _BYTE v50[10];
  _BYTE v51[16];
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = (os_log_t *)MEMORY[0x24BE284B8];
  v8 = *MEMORY[0x24BE284B8];
  v9 = *MEMORY[0x24BE284B8];
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = v8;
      objc_msgSend(v5, "path");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v48 = "+[SSRSpeakerProfileEmbeddingExtractor extractProfileData:completion:]";
      v49 = 2112;
      *(_QWORD *)v50 = v11;
      _os_log_impl(&dword_2117D4000, v10, OS_LOG_TYPE_DEFAULT, "%s Extracting profile from : %@", buf, 0x16u);

    }
    v12 = (void *)MEMORY[0x24BDBCE90];
    objc_msgSend(v5, "path");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "inputStreamWithFileAtPath:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v14, "open");
      objc_msgSend(v14, "read:maxLength:", v51, 16);
      for (i = 0; i != 16; ++i)
      {
        v16 = v51[i];
        v17 = aSpkeratV001[i];
        if (v16 != v17)
        {
          v23 = *v7;
          if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315650;
            v48 = "+[SSRSpeakerProfileEmbeddingExtractor extractProfileData:completion:]";
            v49 = 1024;
            *(_DWORD *)v50 = (char)v16;
            *(_WORD *)&v50[4] = 1024;
            *(_DWORD *)&v50[6] = (char)v17;
            _os_log_error_impl(&dword_2117D4000, v23, OS_LOG_TYPE_ERROR, "%s cannot extract profile embedding : cookie match failed %d %d", buf, 0x18u);
          }
          objc_msgSend(v14, "close");
          v20 = (void *)MEMORY[0x24BDD1540];
          v21 = &unk_24CC99D48;
          goto LABEL_25;
        }
      }
      v46 = 0;
      objc_msgSend(v14, "read:maxLength:", &v46, 4);
      v45 = 0;
      objc_msgSend(v14, "read:maxLength:", &v45, 4);
      v44 = 0;
      objc_msgSend(v14, "read:maxLength:", &v44, 4);
      v43 = 0;
      objc_msgSend(v14, "read:maxLength:", &v43, 4);
      v42 = 0;
      objc_msgSend(v14, "read:maxLength:", &v42, 4);
      v41 = 0;
      objc_msgSend(v14, "read:maxLength:", &v41, 4);
      v40 = 0;
      objc_msgSend(v14, "read:maxLength:", &v40, 4);
      v39 = 0;
      objc_msgSend(v14, "read:maxLength:", &v39, 4);
      v38 = 0;
      objc_msgSend(v14, "read:maxLength:", &v38, 4);
      v37 = 0;
      objc_msgSend(v14, "read:maxLength:", &v37, 4);
      objc_msgSend(v14, "read:maxLength:", &v37, 4);
      objc_msgSend(v14, "read:maxLength:", &v37, 4);
      objc_msgSend(v14, "read:maxLength:", &v37, 4);
      objc_msgSend(v14, "read:maxLength:", &v37, 4);
      objc_msgSend(v14, "read:maxLength:", &v37, 4);
      objc_msgSend(v14, "read:maxLength:", &v37, 4);
      if (v45 == 1)
      {
        v18 = v44;
        if (v44 >= 0x989681)
        {
          v19 = *v7;
          if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315138;
            v48 = "+[SSRSpeakerProfileEmbeddingExtractor extractProfileData:completion:]";
            _os_log_error_impl(&dword_2117D4000, v19, OS_LOG_TYPE_ERROR, "%s header specifies implausible filesize", buf, 0xCu);
          }
          objc_msgSend(v14, "close");
          v20 = (void *)MEMORY[0x24BDD1540];
          v21 = &unk_24CC99D98;
          goto LABEL_25;
        }
        if (v43)
        {
          if (v42)
          {
            if (v40 < v43)
            {
              v26 = *v7;
              if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315138;
                v48 = "+[SSRSpeakerProfileEmbeddingExtractor extractProfileData:completion:]";
                _os_log_error_impl(&dword_2117D4000, v26, OS_LOG_TYPE_ERROR, "%s stride is less than width", buf, 0xCu);
              }
              objc_msgSend(v14, "close");
              v20 = (void *)MEMORY[0x24BDD1540];
              v21 = &unk_24CC99E10;
              goto LABEL_25;
            }
            if (v39 < v42)
            {
              v31 = *v7;
              if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315138;
                v48 = "+[SSRSpeakerProfileEmbeddingExtractor extractProfileData:completion:]";
                _os_log_error_impl(&dword_2117D4000, v31, OS_LOG_TYPE_ERROR, "%s stride is less than width", buf, 0xCu);
              }
              objc_msgSend(v14, "close");
              v20 = (void *)MEMORY[0x24BDD1540];
              v21 = &unk_24CC99E38;
              goto LABEL_25;
            }
            if (v38)
            {
              v32 = *v7;
              if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315138;
                v48 = "+[SSRSpeakerProfileEmbeddingExtractor extractProfileData:completion:]";
                _os_log_error_impl(&dword_2117D4000, v32, OS_LOG_TYPE_ERROR, "%s only float32 dataformat supported", buf, 0xCu);
              }
              objc_msgSend(v14, "close");
              v20 = (void *)MEMORY[0x24BDD1540];
              v21 = &unk_24CC99E60;
              goto LABEL_25;
            }
            if (v44 == 4 * v40 * v39)
            {
              objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", v44);
              v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
              v33 = objc_msgSend(v14, "read:maxLength:", objc_msgSend(v25, "mutableBytes"), v18);
              objc_msgSend(v14, "close");
              if (v33 == v44)
              {
                (*((void (**)(id, id, _QWORD, _QWORD, _QWORD))v6 + 2))(v6, v25, v42, v43, 0);
              }
              else
              {
                v35 = *v7;
                if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 136315138;
                  v48 = "+[SSRSpeakerProfileEmbeddingExtractor extractProfileData:completion:]";
                  _os_log_error_impl(&dword_2117D4000, v35, OS_LOG_TYPE_ERROR, "%s cannot read enough data from file:", buf, 0xCu);
                }
                objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.speakerrecognition"), 759, &unk_24CC99EB0);
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                (*((void (**)(id, _QWORD, _QWORD, _QWORD, void *))v6 + 2))(v6, 0, 0, 0, v36);

              }
              goto LABEL_26;
            }
            v34 = *v7;
            if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315138;
              v48 = "+[SSRSpeakerProfileEmbeddingExtractor extractProfileData:completion:]";
              _os_log_error_impl(&dword_2117D4000, v34, OS_LOG_TYPE_ERROR, "%s unexpected file size", buf, 0xCu);
            }
            objc_msgSend(v14, "close");
            v20 = (void *)MEMORY[0x24BDD1540];
            v21 = &unk_24CC99E88;
          }
          else
          {
            v30 = *v7;
            if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315138;
              v48 = "+[SSRSpeakerProfileEmbeddingExtractor extractProfileData:completion:]";
              _os_log_error_impl(&dword_2117D4000, v30, OS_LOG_TYPE_ERROR, "%s Empty profile", buf, 0xCu);
            }
            v20 = (void *)MEMORY[0x24BDD1540];
            v21 = &unk_24CC99DE8;
          }
        }
        else
        {
          v27 = *v7;
          if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315138;
            v48 = "+[SSRSpeakerProfileEmbeddingExtractor extractProfileData:completion:]";
            _os_log_error_impl(&dword_2117D4000, v27, OS_LOG_TYPE_ERROR, "%s nil vector", buf, 0xCu);
          }
          v20 = (void *)MEMORY[0x24BDD1540];
          v21 = &unk_24CC99DC0;
        }
      }
      else
      {
        v24 = *v7;
        if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          v48 = "+[SSRSpeakerProfileEmbeddingExtractor extractProfileData:completion:]";
          _os_log_error_impl(&dword_2117D4000, v24, OS_LOG_TYPE_ERROR, "%s cannot read incompatible version", buf, 0xCu);
        }
        objc_msgSend(v14, "close");
        v20 = (void *)MEMORY[0x24BDD1540];
        v21 = &unk_24CC99D70;
      }
    }
    else
    {
      v22 = *v7;
      if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR))
      {
        v28 = v22;
        objc_msgSend(v5, "path");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v48 = "+[SSRSpeakerProfileEmbeddingExtractor extractProfileData:completion:]";
        v49 = 2112;
        *(_QWORD *)v50 = v29;
        _os_log_error_impl(&dword_2117D4000, v28, OS_LOG_TYPE_ERROR, "%s cannot extract profile embedding : inputStream = nil, %@", buf, 0x16u);

      }
      v20 = (void *)MEMORY[0x24BDD1540];
      v21 = &unk_24CC99D20;
    }
LABEL_25:
    objc_msgSend(v20, "errorWithDomain:code:userInfo:", CFSTR("com.apple.speakerrecognition"), 759, v21);
    v25 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, _QWORD, id))v6 + 2))(v6, 0, 0, 0, v25);
LABEL_26:

  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v48 = "+[SSRSpeakerProfileEmbeddingExtractor extractProfileData:completion:]";
      _os_log_error_impl(&dword_2117D4000, v8, OS_LOG_TYPE_ERROR, "%s cannot extract profile embedding : profileURL = nil", buf, 0xCu);
    }
    (*((void (**)(id, _QWORD, _QWORD, _QWORD, _QWORD))v6 + 2))(v6, 0, 0, 0, 0);
  }

}

void __75__SSRSpeakerProfileEmbeddingExtractor__extractWithModelContext_completion___block_invoke(_QWORD *a1, void *a2, int a3, int a4, void *a5)
{
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;

  v9 = a2;
  v10 = a5;
  v11 = *(_QWORD *)(a1[4] + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v9;
  v15 = v9;

  *(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = a3;
  *(_DWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = a4;
  v13 = *(_QWORD *)(a1[7] + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = v10;

}

uint64_t __84__SSRSpeakerProfileEmbeddingExtractor_extractSATVoiceProfileWithContext_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __84__SSRSpeakerProfileEmbeddingExtractor_extractPSRVoiceProfileWithContext_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
