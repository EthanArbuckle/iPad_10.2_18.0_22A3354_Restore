@implementation AXPhoenixDataLogger

- (AXPhoenixDataLogger)init
{
  dispatch_queue_t v2;
  OS_dispatch_queue *queue;
  AXPhoenixDataLogger *v5;
  dispatch_queue_attr_t attr;
  objc_super v7;
  SEL v8;
  AXPhoenixDataLogger *v9;

  v8 = a2;
  v9 = 0;
  v7.receiver = self;
  v7.super_class = (Class)AXPhoenixDataLogger;
  v9 = -[AXPhoenixDataLogger init](&v7, sel_init);
  objc_storeStrong((id *)&v9, v9);
  if (v9)
  {
    attr = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    v2 = dispatch_queue_create("com.apple.accessibility.phoenix.dataLogger", attr);
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v2;

    objc_storeStrong((id *)&attr, 0);
  }
  v5 = v9;
  objc_storeStrong((id *)&v9, 0);
  return v5;
}

- (void)logClassifierData:(id)a3 isDoubleTap:(BOOL)a4 startTime:(double)a5 endTime:(double)a6 completion:(id)a7
{
  NSObject *queue;
  uint64_t v12;
  int v13;
  int v14;
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  id v18;
  id v19[3];
  id from;
  id v21[3];
  BOOL v22;
  id location[2];
  AXPhoenixDataLogger *v24;

  v24 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v22 = a4;
  v21[2] = *(id *)&a5;
  v21[1] = *(id *)&a6;
  v21[0] = 0;
  objc_storeStrong(v21, a7);
  objc_initWeak(&from, v24);
  queue = -[AXPhoenixDataLogger queue](v24, "queue");
  v12 = MEMORY[0x24BDAC760];
  v13 = -1073741824;
  v14 = 0;
  v15 = __82__AXPhoenixDataLogger_logClassifierData_isDoubleTap_startTime_endTime_completion___block_invoke;
  v16 = &unk_24F18F8C0;
  objc_copyWeak(v19, &from);
  v17 = location[0];
  v18 = v21[0];
  dispatch_async(queue, &v12);

  objc_storeStrong(&v18, 0);
  objc_storeStrong(&v17, 0);
  objc_destroyWeak(v19);
  objc_destroyWeak(&from);
  objc_storeStrong(v21, 0);
  objc_storeStrong(location, 0);
}

void __82__AXPhoenixDataLogger_logClassifierData_isDoubleTap_startTime_endTime_completion___block_invoke(uint64_t a1)
{
  id v1;
  id v2;
  AXPhoenixMetadataLogger *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  os_log_t v17;
  os_log_type_t v18;
  os_log_t v19;
  id v20;
  AXPhoenixMetadataLogger *v21;
  id v22;
  os_log_type_t v23;
  os_log_t v24;
  id obj;
  id v26;
  id v27;
  id v28;
  os_log_type_t v29;
  os_log_t oslog;
  id v31;
  id v32;
  int v33;
  os_log_type_t type;
  id location;
  id v36;
  char v37;
  id v38[3];
  uint8_t v39[32];
  uint8_t v40[32];
  const __CFString *v41;
  id v42;
  const __CFString *v43;
  id v44;
  uint8_t v45[32];
  _QWORD v46[6];
  _QWORD v47[6];
  uint8_t v48[32];
  uint8_t v49[24];
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v38[2] = (id)a1;
  v38[1] = (id)a1;
  v38[0] = objc_loadWeakRetained((id *)(a1 + 48));
  v37 = 0;
  v36 = 0;
  if (v38[0])
  {
    if ((objc_msgSend(MEMORY[0x24BDD1608], "isValidJSONObject:", *(_QWORD *)(a1 + 32)) & 1) == 0)
    {
      location = (id)AXLogBackTap();
      type = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_2_8_32_8_64((uint64_t)v49, (uint64_t)"-[AXPhoenixDataLogger logClassifierData:isDoubleTap:startTime:endTime:completion:]_block_invoke", *(_QWORD *)(a1 + 32));
        _os_log_error_impl(&dword_228CDB000, (os_log_t)location, type, "[PHOENIX] %s Dictionary is not valid json: %@", v49, 0x16u);
      }
      objc_storeStrong(&location, 0);
      if (*(_QWORD *)(a1 + 40))
        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      v33 = 1;
      goto LABEL_31;
    }
    v32 = (id)objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v1 = +[AXPhoenixDataCollectionUtils createFilename:usingTimestamp:withFileExtension:underDirectory:](AXPhoenixDataCollectionUtils, "createFilename:usingTimestamp:withFileExtension:underDirectory:", CFSTR("motion"), v32, CFSTR("json"), CFSTR("/var/mobile/DTX"));
    v2 = v36;
    v36 = v1;

    if (objc_msgSend(v36, "length"))
    {
      v31 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF08]), "initToFileAtPath:append:", v36, 0);
      if (v31)
      {
        objc_msgSend(v31, "open");
        if ((objc_msgSend(v31, "hasSpaceAvailable") & 1) != 0)
        {
          v28 = 0;
          v27 = (id)objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("accelerometer"));
          v46[0] = CFSTR("predictions");
          v14 = (id)objc_msgSend(*(id *)(a1 + 32), "objectForKey:");
          v47[0] = v14;
          v46[1] = CFSTR("result");
          v13 = (id)objc_msgSend(*(id *)(a1 + 32), "objectForKey:");
          v47[1] = v13;
          v46[2] = CFSTR("startTime");
          v12 = (id)objc_msgSend(*(id *)(a1 + 32), "objectForKey:");
          v47[2] = v12;
          v46[3] = CFSTR("endTime");
          v11 = (id)objc_msgSend(*(id *)(a1 + 32), "objectForKey:");
          v47[3] = v11;
          v46[4] = CFSTR("modelDescription");
          v10 = (id)objc_msgSend(*(id *)(a1 + 32), "objectForKey:");
          v47[4] = v10;
          v46[5] = CFSTR("modelVersion");
          v9 = (id)objc_msgSend(*(id *)(a1 + 32), "objectForKey:");
          v47[5] = v9;
          v26 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v47, v46, 6);

          obj = v28;
          v15 = objc_msgSend(MEMORY[0x24BDD1608], "writeJSONObject:toStream:options:error:", v27, v31, 3, &obj);
          objc_storeStrong(&v28, obj);
          if (v15)
          {
            v24 = (os_log_t)(id)AXLogBackTap();
            v23 = OS_LOG_TYPE_INFO;
            if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
            {
              __os_log_helper_16_2_2_8_32_8_64((uint64_t)v45, (uint64_t)"-[AXPhoenixDataLogger logClassifierData:isDoubleTap:startTime:endTime:completion:]_block_invoke", (uint64_t)v36);
              _os_log_impl(&dword_228CDB000, v24, v23, "[PHOENIX] %s Buffer written to: %@", v45, 0x16u);
            }
            objc_storeStrong((id *)&v24, 0);
            v43 = CFSTR("start_timestamp");
            v44 = v32;
            v22 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v44, &v43);
            v3 = [AXPhoenixMetadataLogger alloc];
            v21 = -[AXPhoenixMetadataLogger initWithMetadata:](v3, "initWithMetadata:", v22);
            -[AXPhoenixMetadataLogger setMetadataFilePathUnderDirectory:](v21, "setMetadataFilePathUnderDirectory:", CFSTR("/var/mobile/DTX"));
            v41 = CFSTR("motion");
            v8 = (id)objc_msgSend(v36, "lastPathComponent");
            v42 = v8;
            v20 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1);

            -[AXPhoenixMetadataLogger writeMetadataToFileWithSensors:withAnnotations:withFalsePositivesMetadata:](v21, "writeMetadataToFileWithSensors:withAnnotations:withFalsePositivesMetadata:", v20, MEMORY[0x24BDBD1B8], v26);
            v37 = 1;
            objc_storeStrong(&v20, 0);
            objc_storeStrong((id *)&v21, 0);
            objc_storeStrong(&v22, 0);
          }
          else
          {
            v19 = (os_log_t)(id)AXLogBackTap();
            v18 = OS_LOG_TYPE_ERROR;
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              __os_log_helper_16_2_3_8_32_8_64_8_64((uint64_t)v40, (uint64_t)"-[AXPhoenixDataLogger logClassifierData:isDoubleTap:startTime:endTime:completion:]_block_invoke", (uint64_t)v36, (uint64_t)v28);
              _os_log_error_impl(&dword_228CDB000, v19, v18, "[PHOENIX] %s Error writing buffer to %@: %@", v40, 0x20u);
            }
            objc_storeStrong((id *)&v19, 0);
          }
          objc_storeStrong(&v26, 0);
          objc_storeStrong(&v27, 0);
          objc_storeStrong(&v28, 0);
        }
        else
        {
          v17 = (os_log_t)(id)AXLogBackTap();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            __os_log_helper_16_2_2_8_32_8_64((uint64_t)v39, (uint64_t)"-[AXPhoenixDataLogger logClassifierData:isDoubleTap:startTime:endTime:completion:]_block_invoke", (uint64_t)v36);
            _os_log_error_impl(&dword_228CDB000, v17, OS_LOG_TYPE_ERROR, "[PHOENIX] %s No space error when writing output stream for %@", v39, 0x16u);
          }
          objc_storeStrong((id *)&v17, 0);
        }
        objc_msgSend(v31, "close");
      }
      else
      {
        oslog = (os_log_t)(id)AXLogBackTap();
        v29 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
        {
          __os_log_helper_16_2_2_8_32_8_64((uint64_t)v48, (uint64_t)"-[AXPhoenixDataLogger logClassifierData:isDoubleTap:startTime:endTime:completion:]_block_invoke", (uint64_t)v36);
          _os_log_error_impl(&dword_228CDB000, oslog, v29, "[PHOENIX] %s Error creating stream for %@", v48, 0x16u);
        }
        objc_storeStrong((id *)&oslog, 0);
      }
      v7 = (id)objc_msgSend(v36, "stringByDeletingPathExtension");
      v6 = (id)objc_msgSend(v7, "lastPathComponent");
      v4 = (id)objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:", CFSTR("_motion"), &stru_24F18FC50);
      v5 = v36;
      v36 = v4;

      objc_storeStrong(&v31, 0);
    }
    objc_storeStrong(&v32, 0);
  }
  if (*(_QWORD *)(a1 + 40))
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v33 = 0;
LABEL_31:
  objc_storeStrong(&v36, 0);
  objc_storeStrong(v38, 0);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
