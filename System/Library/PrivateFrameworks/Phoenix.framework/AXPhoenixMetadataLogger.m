@implementation AXPhoenixMetadataLogger

- (AXPhoenixMetadataLogger)initWithMetadata:(id)a3
{
  AXPhoenixMetadataLogger *v3;
  AXPhoenixMetadataLogger *v5;
  id v6;
  objc_super v7;
  id location[2];
  AXPhoenixMetadataLogger *v9;

  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v9;
  v9 = 0;
  v7.receiver = v3;
  v7.super_class = (Class)AXPhoenixMetadataLogger;
  v9 = -[AXPhoenixMetadataLogger init](&v7, sel_init);
  objc_storeStrong((id *)&v9, v9);
  if (v9)
  {
    v6 = (id)objc_msgSend(location[0], "objectForKeyedSubscript:", CFSTR("start_timestamp"));
    -[AXPhoenixMetadataLogger setStartTimestamp:](v9, "setStartTimestamp:");

  }
  v5 = v9;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v9, 0);
  return v5;
}

- (void)setMetadataFilePathUnderDirectory:(id)a3
{
  id v3;
  NSDate *v4;
  id location[2];
  AXPhoenixMetadataLogger *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = -[AXPhoenixMetadataLogger startTimestamp](v6, "startTimestamp");
  v3 = +[AXPhoenixDataCollectionUtils createFilename:usingTimestamp:withFileExtension:underDirectory:](AXPhoenixDataCollectionUtils, "createFilename:usingTimestamp:withFileExtension:underDirectory:", CFSTR("metadata"));
  -[AXPhoenixMetadataLogger setMetadataFilePath:](v6, "setMetadataFilePath:");

  objc_storeStrong(location, 0);
}

- (NSDateFormatter)dateFormatter
{
  id v3;

  if (!self->_dateFormatter)
  {
    v3 = objc_alloc_init(MEMORY[0x24BDD1500]);
    -[AXPhoenixMetadataLogger setDateFormatter:](self, "setDateFormatter:");

  }
  return self->_dateFormatter;
}

- (void)writeMetadataToFileWithSensors:(id)a3 withAnnotations:(id)a4 withFalsePositivesMetadata:(id)a5
{
  NSString *v5;
  NSString *v6;
  NSDateFormatter *v9;
  NSDate *v10;
  NSDateFormatter *v11;
  NSDateFormatter *v12;
  NSDate *v13;
  NSDateFormatter *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  NSString *v21;
  os_log_t v22;
  os_log_type_t type;
  os_log_t oslog[2];
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id location[2];
  AXPhoenixMetadataLogger *v40;
  uint8_t v41[32];
  uint8_t v42[24];
  _QWORD v43[26];
  _QWORD v44[27];

  v44[26] = *MEMORY[0x24BDAC8D0];
  v40 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v38 = 0;
  objc_storeStrong(&v38, a4);
  v37 = 0;
  objc_storeStrong(&v37, a5);
  v9 = -[AXPhoenixMetadataLogger dateFormatter](v40, "dateFormatter");
  -[NSDateFormatter setDateFormat:](v9, "setDateFormat:", CFSTR("YYYY-MM-dd"));

  v11 = -[AXPhoenixMetadataLogger dateFormatter](v40, "dateFormatter");
  v10 = -[AXPhoenixMetadataLogger startTimestamp](v40, "startTimestamp");
  v36 = -[NSDateFormatter stringFromDate:](v11, "stringFromDate:");

  v12 = -[AXPhoenixMetadataLogger dateFormatter](v40, "dateFormatter");
  -[NSDateFormatter setDateFormat:](v12, "setDateFormat:", CFSTR("HH-mm-ss-SSS"));

  v14 = -[AXPhoenixMetadataLogger dateFormatter](v40, "dateFormatter");
  v13 = -[AXPhoenixMetadataLogger startTimestamp](v40, "startTimestamp");
  v35 = -[NSDateFormatter stringFromDate:](v14, "stringFromDate:");

  v34 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lu"), 7);
  v16 = (id)objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v15 = (id)objc_msgSend(v16, "identifierForVendor");
  v33 = (id)objc_msgSend(v15, "UUIDString");

  v32 = (id)objc_msgSend(v33, "substringToIndex:", 5);
  v31 = -[AXPhoenixMetadataLogger _deviceModelName](v40, "_deviceModelName");
  v17 = (id)objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v30 = (id)objc_msgSend(v17, "operatingSystemVersionString");

  v19 = (id)objc_msgSend(MEMORY[0x24BDBCF38], "localTimeZone");
  v18 = (id)objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v29 = (id)objc_msgSend(v19, "localizedName:locale:", 0);

  v28 = -[AXPhoenixMetadataLogger _orientationString](v40, "_orientationString");
  v27 = -[AXPhoenixMetadataLogger _fullHardwareConfigurationString](v40, "_fullHardwareConfigurationString");
  v43[0] = CFSTR("username");
  v44[0] = v32;
  v43[1] = CFSTR("first_name");
  v44[1] = v32;
  v43[2] = CFSTR("last_name");
  v44[2] = v32;
  v43[3] = CFSTR("shift_key");
  v44[3] = v34;
  v43[4] = CFSTR("tap_location");
  v44[4] = CFSTR("unset");
  v43[5] = CFSTR("gesture");
  v44[5] = CFSTR("unset");
  v43[6] = CFSTR("activity");
  v44[6] = CFSTR("general");
  v43[7] = CFSTR("case");
  v44[7] = CFSTR("unknown");
  v43[8] = CFSTR("negative_category");
  v44[8] = CFSTR("general");
  v43[9] = CFSTR("data_collection_source");
  v44[9] = CFSTR("carry-fp");
  v43[10] = CFSTR("data_collection_phase");
  v44[10] = CFSTR("production-2");
  v43[11] = CFSTR("data_type");
  v44[11] = CFSTR("negative");
  v43[12] = CFSTR("date_collected");
  v44[12] = v36;
  v43[13] = CFSTR("time_collected");
  v44[13] = v35;
  v43[14] = CFSTR("sensors");
  v44[14] = location[0];
  v43[15] = CFSTR("annotations");
  v44[15] = v38;
  v43[16] = CFSTR("false_positive_metadata");
  v44[16] = v37;
  v43[17] = CFSTR("device_model");
  v44[17] = v31;
  v43[18] = CFSTR("uuid");
  v44[18] = v33;
  v43[19] = CFSTR("os");
  v44[19] = v30;
  v43[20] = CFSTR("time_zone");
  v44[20] = v29;
  v43[21] = CFSTR("device_orientation");
  v44[21] = v28;
  v43[22] = CFSTR("full_hardware_config");
  v44[22] = v27;
  v43[23] = CFSTR("accel_sample_rate_hz");
  v44[23] = CFSTR("100.00");
  v43[24] = CFSTR("gyro_sample_rate_hz");
  v44[24] = CFSTR("100.00");
  v43[25] = CFSTR("user_accel_sample_rate_hz");
  v44[25] = CFSTR("100.00");
  v26 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v44, v43, 26);
  v20 = objc_alloc(MEMORY[0x24BDBCF08]);
  v21 = -[AXPhoenixMetadataLogger metadataFilePath](v40, "metadataFilePath");
  v25 = (id)objc_msgSend(v20, "initToFileAtPath:append:");

  objc_msgSend(v25, "open");
  oslog[1] = (os_log_t)3;
  if (objc_msgSend(MEMORY[0x24BDD1608], "writeJSONObject:toStream:options:error:", v26, v25, 3, 0))
  {
    oslog[0] = (os_log_t)(id)AXLogBackTap();
    type = OS_LOG_TYPE_INFO;
    if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_INFO))
    {
      v6 = -[AXPhoenixMetadataLogger metadataFilePath](v40, "metadataFilePath");
      __os_log_helper_16_2_2_8_32_8_64((uint64_t)v42, (uint64_t)"-[AXPhoenixMetadataLogger writeMetadataToFileWithSensors:withAnnotations:withFalsePositivesMetadata:]", (uint64_t)v6);
      _os_log_impl(&dword_228CDB000, oslog[0], type, "[PHOENIX] %s Metadata written to: %@", v42, 0x16u);

    }
    objc_storeStrong((id *)oslog, 0);
  }
  else
  {
    v22 = (os_log_t)(id)AXLogBackTap();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v5 = -[AXPhoenixMetadataLogger metadataFilePath](v40, "metadataFilePath");
      __os_log_helper_16_2_2_8_32_8_64((uint64_t)v41, (uint64_t)"-[AXPhoenixMetadataLogger writeMetadataToFileWithSensors:withAnnotations:withFalsePositivesMetadata:]", (uint64_t)v5);
      _os_log_error_impl(&dword_228CDB000, v22, OS_LOG_TYPE_ERROR, "[PHOENIX] %s Error writing data collection metadata to: %@", v41, 0x16u);

    }
    objc_storeStrong((id *)&v22, 0);
  }
  objc_msgSend(v25, "close");
  objc_storeStrong(&v25, 0);
  objc_storeStrong(&v26, 0);
  objc_storeStrong(&v27, 0);
  objc_storeStrong(&v28, 0);
  objc_storeStrong(&v29, 0);
  objc_storeStrong(&v30, 0);
  objc_storeStrong(&v31, 0);
  objc_storeStrong(&v32, 0);
  objc_storeStrong(&v33, 0);
  objc_storeStrong(&v34, 0);
  objc_storeStrong(&v35, 0);
  objc_storeStrong(&v36, 0);
  objc_storeStrong(&v37, 0);
  objc_storeStrong(&v38, 0);
  objc_storeStrong(location, 0);
}

- (id)_deviceModelName
{
  id v3;
  id v4[3];
  utsname v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v4[2] = self;
  v4[1] = (id)a2;
  bzero(&v5, 0x200uLL);
  uname(&v5);
  v4[0] = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v5.machine, 4);
  v3 = v4[0];
  objc_storeStrong(v4, 0);
  return v3;
}

- (id)_fullHardwareConfigurationString
{
  return (id)objc_msgSend((id)_fullHardwareConfigurationString___config, "stringByReplacingOccurrencesOfString:withString:", CFSTR("/"), CFSTR("___"), a2, self);
}

- (id)_orientationString
{
  id v3;
  unint64_t v4;
  void *v5;

  v3 = (id)objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v4 = objc_msgSend(v3, "orientation");

  if (v4 <= 6)
    __asm { BR              X8 }
  return v5;
}

- (NSDate)startTimestamp
{
  return self->_startTimestamp;
}

- (void)setStartTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_startTimestamp, a3);
}

- (NSString)metadataFilePath
{
  return self->_metadataFilePath;
}

- (void)setMetadataFilePath:(id)a3
{
  objc_storeStrong((id *)&self->_metadataFilePath, a3);
}

- (void)setDateFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_dateFormatter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_metadataFilePath, 0);
  objc_storeStrong((id *)&self->_startTimestamp, 0);
}

@end
