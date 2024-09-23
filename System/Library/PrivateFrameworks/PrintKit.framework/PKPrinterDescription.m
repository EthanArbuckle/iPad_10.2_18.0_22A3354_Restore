@implementation PKPrinterDescription

+ (id)standardRequestedAttributes
{
  _QWORD v3[34];

  v3[33] = *MEMORY[0x24BDAC8D0];
  v3[0] = IPPNomenclature::keyCopiesSupported;
  v3[1] = IPPNomenclature::keyDocumentFormatSupported;
  v3[2] = IPPNomenclature::keyDocumentPasswordSupported;
  v3[3] = IPPNomenclature::keyFinishingsColDatabase;
  v3[4] = IPPNomenclature::keyFinishingsSupported;
  v3[5] = IPPNomenclature::keyOutputBinDefault;
  v3[6] = IPPNomenclature::keyPrinterOutputTray;
  v3[7] = IPPNomenclature::keyOutputBinSupported;
  v3[8] = IPPNomenclature::keyIdentifyActionsSupported;
  v3[9] = IPPNomenclature::keyJobAccountIDSupported;
  v3[10] = IPPNomenclature::keyJpegFeaturesSupported;
  v3[11] = IPPNomenclature::keyJpegKOctetsSupported;
  v3[12] = IPPNomenclature::keyJpegXDimensionSupported;
  v3[13] = IPPNomenclature::keyJpegYDimensionSupported;
  v3[14] = IPPNomenclature::keyLandscapeOrientationRequestedPreferred;
  v3[15] = IPPNomenclature::keyMediaColSupported;
  v3[16] = IPPNomenclature::keyMediaSourceSupported;
  v3[17] = IPPNomenclature::keyMediaColReady;
  v3[18] = IPPNomenclature::keyOperationsSupported;
  v3[19] = IPPNomenclature::keyPdfKOctetsSupported;
  v3[20] = IPPNomenclature::keyPrintColorModeSupported;
  v3[21] = IPPNomenclature::keyPrintQualitySupported;
  v3[22] = IPPNomenclature::keyPrintScalingSupported;
  v3[23] = IPPNomenclature::keyPrinterChargeInfoUri;
  v3[24] = IPPNomenclature::keyPrinterInputTray;
  v3[25] = IPPNomenclature::keyMediaTypeSupported;
  v3[26] = IPPNomenclature::keyPrinterMandatoryJobAttributes;
  v3[27] = IPPNomenclature::keyPrinterStateReasons;
  v3[28] = IPPNomenclature::keySidesSupported;
  v3[29] = IPPNomenclature::keyJobPresetsSupported;
  v3[30] = IPPNomenclature::keyPrinterMoreInfo;
  v3[31] = IPPNomenclature::keyPrinterSupplyInfoURI;
  v3[32] = IPPNomenclature::keyPrinterStringsURI;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 33);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)txtRecordReconstructingAttributes
{
  _QWORD v3[14];

  v3[13] = *MEMORY[0x24BDAC8D0];
  v3[0] = IPPNomenclature::keyDocumentFormatSupported;
  v3[1] = IPPNomenclature::keyOutputModeSupported;
  v3[2] = IPPNomenclature::keyPrintColorModeSupported;
  v3[3] = IPPNomenclature::keyPrinterDNS_SD_Name;
  v3[4] = IPPNomenclature::keyPrinterKind;
  v3[5] = IPPNomenclature::keyPrinterLocation;
  v3[6] = IPPNomenclature::keyPrinterMakeAndModel;
  v3[7] = IPPNomenclature::keyPrinterMoreInfo;
  v3[8] = IPPNomenclature::keyPrinterName;
  v3[9] = IPPNomenclature::keyPrinterUUID;
  v3[10] = IPPNomenclature::keySidesSupported;
  v3[11] = IPPNomenclature::keyURFSupported;
  v3[12] = IPPNomenclature::keyURIAuthenticationSupported;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 13);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)printInfoSupportedDictionary
{
  void *v3;
  void *v4;
  NSArray *sides;
  NSArray *orientations;
  NSArray *quality;
  NSArray *formats;
  NSArray *mediaColSupportedArray;
  void *v10;
  NSArray *outputModes;
  NSArray *finishings;
  NSArray *finishingTemplates;
  NSArray *outputBins;
  NSArray *inputSlots;
  NSArray *mediaTypes;
  NSArray *jobPresets;
  NSURL *printerInfoURL;
  NSURL *suppliesInfoURL;

  v3 = (void *)objc_opt_new();
  v4 = v3;
  sides = self->_sides;
  if (sides)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", sides, CFSTR("sides"));
  orientations = self->_orientations;
  if (orientations)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", orientations, CFSTR("orientation-requested"));
  quality = self->_quality;
  if (quality)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", quality, CFSTR("print-quality"));
  formats = self->_formats;
  if (formats)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", formats, CFSTR("document-format"));
  mediaColSupportedArray = self->_mediaColSupportedArray;
  if (mediaColSupportedArray)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", mediaColSupportedArray, CFSTR("media-col-supported"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_supportsPrintColorMode);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("com.apple.supportsPrintColorMode"));

  outputModes = self->_outputModes;
  if (outputModes)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", outputModes, CFSTR("print-color-mode"));
  finishings = self->_finishings;
  if (finishings)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", finishings, CFSTR("com.apple.finishings"));
  finishingTemplates = self->_finishingTemplates;
  if (finishingTemplates)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", finishingTemplates, CFSTR("com.apple.finishingTemplate"));
  outputBins = self->_outputBins;
  if (outputBins)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", outputBins, CFSTR("com.apple.outputBin"));
  inputSlots = self->_inputSlots;
  if (inputSlots)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", inputSlots, CFSTR("com.apple.inputSlot"));
  mediaTypes = self->_mediaTypes;
  if (mediaTypes)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", mediaTypes, CFSTR("com.apple.mediaType"));
  jobPresets = self->_jobPresets;
  if (jobPresets)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", jobPresets, CFSTR("com.apple.jobPreset"));
  printerInfoURL = self->_printerInfoURL;
  if (printerInfoURL)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", printerInfoURL, CFSTR("PrinterInfoURL"));
  suppliesInfoURL = self->_suppliesInfoURL;
  if (suppliesInfoURL)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", suppliesInfoURL, CFSTR("PrinterSuppliesURL"));
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKPrinterDescription;
  -[PKPrinterDescription description](&v3, sel_description);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSString)debugDescription
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__2;
  v9 = __Block_byref_object_dispose__2;
  v10 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __40__PKPrinterDescription_debugDescription__block_invoke;
  v4[3] = &unk_24E6CD710;
  v4[4] = self;
  v4[5] = &v5;
  DescVisitor::visitProperties(self, v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSString *)v2;
}

void __40__PKPrinterDescription_debugDescription__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v4 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(*(id *)(a1 + 32), "description");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t))(*(_QWORD *)a2 + 208))(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t))(*(_QWORD *)a2 + 200))(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ Encoded classes: %@, properties %@"), v10, v5, v6);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

}

- (void)visitProperties:(Visitor *)a3
{
  (*((void (**)(Visitor *, SEL))a3->var0 + 2))(a3, a2);
  (*((void (**)(Visitor *, const __CFString *, BOOL *))a3->var0 + 3))(a3, CFSTR("type_has_duplex"), &self->_type_has_duplex);
  (*((void (**)(Visitor *, const __CFString *, BOOL *))a3->var0 + 3))(a3, CFSTR("type_has_color"), &self->_type_has_color);
  (*((void (**)(Visitor *, const __CFString *, NSSet **))a3->var0 + 16))(a3, CFSTR("attrs_document_format_supported"), &self->_attrs_document_format_supported);
  (*((void (**)(Visitor *, const __CFString *, NSSet **))a3->var0 + 16))(a3, CFSTR("attrs_printer_native_formats"), &self->_attrs_printer_native_formats);
  (*((void (**)(Visitor *, const __CFString *, NSArray **))a3->var0 + 15))(a3, CFSTR("attrs_media_source_supported"), &self->_attrs_media_source_supported);
  (*((void (**)(Visitor *, const __CFString *, NSString **))a3->var0 + 7))(a3, CFSTR("driverformat"), &self->_driverformat);
  (*((void (**)(Visitor *, const __CFString *, NSSet **))a3->var0 + 16))(a3, CFSTR("jpegFeatures"), &self->_jpegFeatures);
  (*((void (**)(Visitor *, const __CFString *, NSSet **))a3->var0 + 16))(a3, CFSTR("mandatoryJobAttributes"), &self->_mandatoryJobAttributes);
  (*((void (**)(Visitor *, const __CFString *, int *))a3->var0 + 4))(a3, CFSTR("documentPasswordSupported"), &self->_documentPasswordSupported);
  (*((void (**)(Visitor *, const __CFString *, unint64_t *))a3->var0 + 6))(a3, CFSTR("jobAccountIDSupport"), &self->_jobAccountIDSupport);
  (*((void (**)(Visitor *, const __CFString *, int *))a3->var0 + 4))(a3, CFSTR("max_pdf"), &self->_max_pdf);
  (*((void (**)(Visitor *, const __CFString *, int *))a3->var0 + 4))(a3, CFSTR("max_jpeg"), &self->_max_jpeg);
  (*((void (**)(Visitor *, const __CFString *, int *))a3->var0 + 4))(a3, CFSTR("max_jpeg_x"), &self->_max_jpeg_x);
  (*((void (**)(Visitor *, const __CFString *, int *))a3->var0 + 4))(a3, CFSTR("max_jpeg_y"), &self->_max_jpeg_y);
  (*((void (**)(Visitor *, const __CFString *, int *))a3->var0 + 4))(a3, CFSTR("preferred_landscape"), &self->_preferred_landscape);
  (*((void (**)(Visitor *, const __CFString *, BOOL *))a3->var0 + 3))(a3, CFSTR("print_scaling_supported"), &self->_print_scaling_supported);
  (*((void (**)(Visitor *, const __CFString *, BOOL *))a3->var0 + 3))(a3, CFSTR("pin_required"), &self->_pin_required);
  (*((void (**)(Visitor *, const __CFString *, unint64_t *))a3->var0 + 6))(a3, CFSTR("printer_type_from_cups_scalar"), &self->_printer_type_from_cups_scalar);
  (*((void (**)(Visitor *, const __CFString *, int *))a3->var0 + 4))(a3, CFSTR("identifyActions"), &self->_identifyActions);
  (*((void (**)(Visitor *, const __CFString *, NSArray **))a3->var0 + 15))(a3, CFSTR("sides"), &self->_sides);
  (*((void (**)(Visitor *, const __CFString *, NSArray **))a3->var0 + 15))(a3, CFSTR("orientations"), &self->_orientations);
  (*((void (**)(Visitor *, const __CFString *, NSArray **))a3->var0 + 15))(a3, CFSTR("quality"), &self->_quality);
  (*((void (**)(Visitor *, const __CFString *, NSArray **))a3->var0 + 15))(a3, CFSTR("formats"), &self->_formats);
  (*((void (**)(Visitor *, const __CFString *, NSArray **))a3->var0 + 15))(a3, CFSTR("mediaColSupportedArray"), &self->_mediaColSupportedArray);
  (*((void (**)(Visitor *, const __CFString *, NSDictionary **))a3->var0 + 18))(a3, CFSTR("specialFeedOrientation"), &self->_specialFeedOrientation);
  (*((void (**)(Visitor *, const __CFString *, BOOL *))a3->var0 + 3))(a3, CFSTR("supportsPrintColorMode"), &self->_supportsPrintColorMode);
  (*((void (**)(Visitor *, const __CFString *, PKPaperList **))a3->var0 + 20))(a3, CFSTR("paperList"), &self->_paperList);
  (*((void (**)(Visitor *, const __CFString *, NSArray **))a3->var0 + 15))(a3, CFSTR("outputModes"), &self->_outputModes);
  (*((void (**)(Visitor *, const __CFString *, NSArray **))a3->var0 + 14))(a3, CFSTR("finishings"), &self->_finishings);
  (*((void (**)(Visitor *, const __CFString *, NSArray **))a3->var0 + 17))(a3, CFSTR("finishingTemplates"), &self->_finishingTemplates);
  (*((void (**)(Visitor *, const __CFString *, NSArray **))a3->var0 + 17))(a3, CFSTR("outputBins"), &self->_outputBins);
  (*((void (**)(Visitor *, const __CFString *, NSArray **))a3->var0 + 22))(a3, CFSTR("trays"), &self->_trays);
  (*((void (**)(Visitor *, const __CFString *, NSArray **))a3->var0 + 17))(a3, CFSTR("inputSlots"), &self->_inputSlots);
  (*((void (**)(Visitor *, const __CFString *, NSArray **))a3->var0 + 17))(a3, CFSTR("mediaTypes"), &self->_mediaTypes);
  (*((void (**)(Visitor *, const __CFString *, NSArray **))a3->var0 + 17))(a3, CFSTR("jobPresets"), &self->_jobPresets);
  (*((void (**)(Visitor *, const __CFString *, NSURL **))a3->var0 + 8))(a3, CFSTR("printerInfoURL"), &self->_printerInfoURL);
  (*((void (**)(Visitor *, const __CFString *, NSURL **))a3->var0 + 8))(a3, CFSTR("suppliesInfoURL"), &self->_suppliesInfoURL);
  (*((void (**)(Visitor *, const __CFString *, NSURL **))a3->var0 + 8))(a3, CFSTR("quotaManagementURL"), &self->_quotaManagementURL);
  (*((void (**)(Visitor *, const __CFString *, NSString **))a3->var0 + 7))(a3, CFSTR("deviceID"), &self->_deviceID);
  (*((void (**)(Visitor *, const __CFString *, NSDictionary **))a3->var0 + 12))(a3, CFSTR("dids"), &self->_dids);
  (*((void (**)(Visitor *, const __CFString *, NSDictionary **))a3->var0 + 12))(a3, CFSTR("translations"), &self->_translations);
  (*((void (**)(Visitor *))a3->var0 + 24))(a3);
}

- (PKPrinterDescription)initWithCoder:(id)a3
{
  id v4;
  PKPrinterDescription *v5;
  uint64_t v6;
  uint64_t v7;
  NSDictionary *txtRecord;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKPrinterDescription;
  v5 = -[PKPrinterDescription init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend(v4, "decodeDictionaryWithKeysOfClass:objectsOfClass:forKey:", v6, objc_opt_class(), CFSTR("_txtRecord"));
    v7 = objc_claimAutoreleasedReturnValue();
    txtRecord = v5->_txtRecord;
    v5->_txtRecord = (NSDictionary *)v7;

    DecodeVisitor::visitProperties(v5, v4);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSDictionary *txtRecord;
  id v5;

  v5 = a3;
  txtRecord = self->_txtRecord;
  if (txtRecord)
    objc_msgSend(v5, "encodeObject:forKey:", txtRecord, CFSTR("_txtRecord"));
  EncodeVisitor::visitProperties(self, v5);

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = 0;
    v9 = &v8;
    v10 = 0x2020000000;
    v11 = 0;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __32__PKPrinterDescription_isEqual___block_invoke;
    v7[3] = &unk_24E6CD738;
    v7[4] = &v8;
    CompareVisitor::visitProperties(self, v4, v7);
    v5 = *((_BYTE *)v9 + 24) != 0;
    _Block_object_dispose(&v8, 8);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

uint64_t __32__PKPrinterDescription_isEqual___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = (*(uint64_t (**)(uint64_t))(*(_QWORD *)a2 + 200))(a2);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (id)userCodableDictionary
{
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  v3 = (void *)objc_opt_new();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __45__PKPrinterDescription_userCodableDictionary__block_invoke;
  v6[3] = &unk_24E6CD670;
  v4 = v3;
  v7 = v4;
  UserCodedSerializationVisitor::visitProperties(self, (uint64_t)v6);

  return v4;
}

void __45__PKPrinterDescription_userCodableDictionary__block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, _QWORD *a5)
{
  id v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  v8 = a3;
  v9 = v8;
  if (*a5)
  {
    (*((void (**)(id))v8 + 2))(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v10, v11);

  }
}

- (PKPrinterDescription)initWithUserCodableDictionary:(id)a3
{
  id v4;
  PKPrinterDescription *v5;
  _QWORD v7[4];
  id v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPrinterDescription;
  v5 = -[PKPrinterDescription init](&v9, sel_init);
  if (v5)
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __54__PKPrinterDescription_initWithUserCodableDictionary___block_invoke;
    v7[3] = &unk_24E6CD670;
    v8 = v4;
    UserCodedSerializationVisitor::visitProperties(v5, (uint64_t)v7);

  }
  return v5;
}

void __54__PKPrinterDescription_initWithUserCodableDictionary___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4, void **a5)
{
  void (**v8)(id, void *);
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a2;
  v8 = a4;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v8[2](v8, v9);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *a5;
    *a5 = (void *)v10;

  }
}

- (id)makeTXTRecordWithURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  void *v25;
  _BOOL4 v26;
  NSObject *v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  id v34;
  __int16 v35;
  uint64_t v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", CFSTR("1"), CFSTR("txtvers"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", CFSTR("1"), CFSTR("qtotal"));
  objc_msgSend(v4, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("rp"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ty"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ty"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("(%@)"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, CFSTR("product"));

  }
  if (-[PKPrinterDescription supportsPrintColorMode](self, "supportsPrintColorMode"))
    v11 = CFSTR("T");
  else
    v11 = CFSTR("F");
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, CFSTR("color"));
  if (-[PKPrinterDescription type_has_duplex](self, "type_has_duplex"))
    v12 = CFSTR("T");
  else
    v12 = CFSTR("F");
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, CFSTR("duplex"));
  -[PKPrinterDescription formats](self, "formats");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "componentsJoinedByString:", CFSTR(","));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, CFSTR("pdl"));

  -[PKPrinterDescription deviceID](self, "deviceID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v15, CFSTR("urf"));

  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "UUIDString");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    if (objc_msgSend(v17, "hasPrefix:", CFSTR("urn:uuid:")))
    {
      objc_msgSend(v17, "substringFromIndex:", objc_msgSend(CFSTR("urn:uuid:"), "length"));
      v18 = objc_claimAutoreleasedReturnValue();

      v17 = (void *)v18;
    }
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v17, CFSTR("uuid"));
  }
  -[PKPrinterDescription dids](self, "dids");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("MDL"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v20, CFSTR("display-name"));

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v21 = objc_msgSend(&unk_24E6EB2D0, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
  if (v21)
  {
    v22 = *(_QWORD *)v30;
    while (2)
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v30 != v22)
          objc_enumerationMutation(&unk_24E6EB2D0);
        v24 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(v5, "objectForKey:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = v25 == 0;

        if (v26)
        {
          _PKLogCategory(PKLogCategoryDiscovery[0]);
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            v34 = v4;
            v35 = 2114;
            v36 = v24;
            _os_log_impl(&dword_220F9A000, v27, OS_LOG_TYPE_ERROR, "txt record for '%{public}@' does not contain '%{public}@', not AirPrint compliant", buf, 0x16u);
          }

          v5 = 0;
          goto LABEL_25;
        }
      }
      v21 = objc_msgSend(&unk_24E6EB2D0, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
      if (v21)
        continue;
      break;
    }
  }
LABEL_25:

  return v5;
}

- (BOOL)type_has_duplex
{
  return self->_type_has_duplex;
}

- (BOOL)type_has_color
{
  return self->_type_has_color;
}

- (NSSet)attrs_document_format_supported
{
  return (NSSet *)objc_getProperty(self, a2, 56, 1);
}

- (NSSet)attrs_printer_native_formats
{
  return (NSSet *)objc_getProperty(self, a2, 64, 1);
}

- (NSArray)attrs_media_source_supported
{
  return (NSArray *)objc_getProperty(self, a2, 72, 1);
}

- (NSString)driverformat
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (NSSet)jpegFeatures
{
  return (NSSet *)objc_getProperty(self, a2, 88, 1);
}

- (NSSet)mandatoryJobAttributes
{
  return (NSSet *)objc_getProperty(self, a2, 96, 1);
}

- (int)documentPasswordSupported
{
  return self->_documentPasswordSupported;
}

- (unint64_t)jobAccountIDSupport
{
  return self->_jobAccountIDSupport;
}

- (int)max_pdf
{
  return self->_max_pdf;
}

- (int)max_jpeg
{
  return self->_max_jpeg;
}

- (int)max_jpeg_x
{
  return self->_max_jpeg_x;
}

- (int)max_jpeg_y
{
  return self->_max_jpeg_y;
}

- (int)preferred_landscape
{
  return self->_preferred_landscape;
}

- (BOOL)print_scaling_supported
{
  return self->_print_scaling_supported;
}

- (BOOL)pin_required
{
  return self->_pin_required;
}

- (unint64_t)printer_type_from_cups_scalar
{
  return self->_printer_type_from_cups_scalar;
}

- (int)identifyActions
{
  return self->_identifyActions;
}

- (NSArray)sides
{
  return (NSArray *)objc_getProperty(self, a2, 120, 1);
}

- (NSArray)orientations
{
  return (NSArray *)objc_getProperty(self, a2, 128, 1);
}

- (NSArray)quality
{
  return (NSArray *)objc_getProperty(self, a2, 136, 1);
}

- (NSArray)formats
{
  return (NSArray *)objc_getProperty(self, a2, 144, 1);
}

- (NSArray)mediaColSupportedArray
{
  return (NSArray *)objc_getProperty(self, a2, 152, 1);
}

- (NSDictionary)specialFeedOrientation
{
  return (NSDictionary *)objc_getProperty(self, a2, 160, 1);
}

- (BOOL)supportsPrintColorMode
{
  return self->_supportsPrintColorMode;
}

- (PKPaperList)paperList
{
  return (PKPaperList *)objc_getProperty(self, a2, 168, 1);
}

- (NSArray)outputModes
{
  return (NSArray *)objc_getProperty(self, a2, 176, 1);
}

- (NSArray)finishings
{
  return (NSArray *)objc_getProperty(self, a2, 184, 1);
}

- (NSArray)finishingTemplates
{
  return (NSArray *)objc_getProperty(self, a2, 192, 1);
}

- (NSArray)outputBins
{
  return (NSArray *)objc_getProperty(self, a2, 200, 1);
}

- (NSArray)trays
{
  return (NSArray *)objc_getProperty(self, a2, 208, 1);
}

- (NSArray)inputSlots
{
  return (NSArray *)objc_getProperty(self, a2, 216, 1);
}

- (NSArray)mediaTypes
{
  return (NSArray *)objc_getProperty(self, a2, 224, 1);
}

- (NSArray)jobPresets
{
  return (NSArray *)objc_getProperty(self, a2, 232, 1);
}

- (NSURL)printerInfoURL
{
  return (NSURL *)objc_getProperty(self, a2, 240, 1);
}

- (NSURL)suppliesInfoURL
{
  return (NSURL *)objc_getProperty(self, a2, 248, 1);
}

- (NSURL)quotaManagementURL
{
  return (NSURL *)objc_getProperty(self, a2, 256, 1);
}

- (NSString)deviceID
{
  return (NSString *)objc_getProperty(self, a2, 264, 1);
}

- (NSDictionary)dids
{
  return (NSDictionary *)objc_getProperty(self, a2, 272, 1);
}

- (NSDictionary)translations
{
  return (NSDictionary *)objc_getProperty(self, a2, 280, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_translations, 0);
  objc_storeStrong((id *)&self->_dids, 0);
  objc_storeStrong((id *)&self->_deviceID, 0);
  objc_storeStrong((id *)&self->_quotaManagementURL, 0);
  objc_storeStrong((id *)&self->_suppliesInfoURL, 0);
  objc_storeStrong((id *)&self->_printerInfoURL, 0);
  objc_storeStrong((id *)&self->_jobPresets, 0);
  objc_storeStrong((id *)&self->_mediaTypes, 0);
  objc_storeStrong((id *)&self->_inputSlots, 0);
  objc_storeStrong((id *)&self->_trays, 0);
  objc_storeStrong((id *)&self->_outputBins, 0);
  objc_storeStrong((id *)&self->_finishingTemplates, 0);
  objc_storeStrong((id *)&self->_finishings, 0);
  objc_storeStrong((id *)&self->_outputModes, 0);
  objc_storeStrong((id *)&self->_paperList, 0);
  objc_storeStrong((id *)&self->_specialFeedOrientation, 0);
  objc_storeStrong((id *)&self->_mediaColSupportedArray, 0);
  objc_storeStrong((id *)&self->_formats, 0);
  objc_storeStrong((id *)&self->_quality, 0);
  objc_storeStrong((id *)&self->_orientations, 0);
  objc_storeStrong((id *)&self->_sides, 0);
  objc_storeStrong((id *)&self->_mandatoryJobAttributes, 0);
  objc_storeStrong((id *)&self->_jpegFeatures, 0);
  objc_storeStrong((id *)&self->_driverformat, 0);
  objc_storeStrong((id *)&self->_attrs_media_source_supported, 0);
  objc_storeStrong((id *)&self->_attrs_printer_native_formats, 0);
  objc_storeStrong((id *)&self->_attrs_document_format_supported, 0);
  objc_storeStrong((id *)&self->_txtRecord, 0);
}

+ (id)attributesRequiredForPKPaperList
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x24BDAC8D0];
  v3[0] = IPPNomenclature::keyMediaColReady;
  v3[1] = IPPNomenclature::keyMediaColDatabase;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (PKPrinterDescription)initWithAttributes:(const GET_PRINTER_ATTRIBUTES_Response *)a3 translations:(id)a4
{
  id v7;
  PKPrinterDescription *v8;
  PKPrinterDescription *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PKPrinterDescription;
  v8 = -[PKPrinterDescription init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_translations, a4);
    -[PKPrinterDescription _ingestAttrs:](v9, "_ingestAttrs:", a3);
  }

  return v9;
}

- (PKPrinterDescription)initWithTXT:(id)a3
{
  id v4;
  PKPrinterDescription *v5;
  PKPrinterDescription *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PKPrinterDescription;
  v5 = -[PKPrinterDescription init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[PKPrinterDescription _ingestTxtRecord:](v5, "_ingestTxtRecord:", v4);

  return v6;
}

- (PKPrinterDescription)initWithAttributes:(const GET_PRINTER_ATTRIBUTES_Response *)a3 txtRecord:(id)a4 translations:(id)a5
{
  id v8;
  id v9;
  PKPrinterDescription *v10;
  PKPrinterDescription *v11;
  objc_super v13;

  v8 = a4;
  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)PKPrinterDescription;
  v10 = -[PKPrinterDescription init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_translations, a5);
    -[PKPrinterDescription _ingestTxtRecord:](v11, "_ingestTxtRecord:", v8);
    -[PKPrinterDescription _ingestAttrs:](v11, "_ingestAttrs:", a3);
  }

  return v11;
}

- (id)_calcFinishingTemplates:(const GET_PRINTER_ATTRIBUTES_Response *)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  PK_ipp_attribute_t *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v23;
  void *v24;
  id v26;
  id v27;
  id obj;
  void *v29;
  _QWORD v30[4];
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v26 = (id)objc_opt_new();
  Printd_Parameters::_get_FinishingsColDatabase(&a3->var0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v24, "count"))
  {
    v29 = (void *)objc_opt_new();
    GetLocalizedNameForOption(CFSTR("none"), CFSTR("FinishingTemplates"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", CFSTR("none"), CFSTR("finishingTemplateChoice"), v23, CFSTR("finishingTemplateText"), 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addObject:", v4);

    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    obj = v24;
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v37 != v6)
            objc_enumerationMutation(obj);
          v8 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
          objc_msgSend(v8, "_findAttribute0:valueTag:", CFSTR("finishing-template"), 0);
          v9 = (PK_ipp_attribute_t *)objc_claimAutoreleasedReturnValue();
          ippGetIXString(v9, 0);
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          if (v10
            && (objc_msgSend(v29, "containsObject:", v10) & 1) == 0
            && objc_msgSend(v10, "hasPrefix:", CFSTR("fold-")))
          {
            v34 = 0u;
            v35 = 0u;
            v32 = 0u;
            v33 = 0u;
            v11 = objc_msgSend(&unk_24E6EB2E8, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
            if (v11)
            {
              v12 = *(_QWORD *)v33;
LABEL_12:
              v13 = 0;
              while (1)
              {
                if (*(_QWORD *)v33 != v12)
                  objc_enumerationMutation(&unk_24E6EB2E8);
                if ((objc_msgSend(v10, "containsString:", *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v13)) & 1) != 0)
                  break;
                if (v11 == ++v13)
                {
                  v11 = objc_msgSend(&unk_24E6EB2E8, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
                  if (v11)
                    goto LABEL_12;
                  goto LABEL_18;
                }
              }
            }
            else
            {
LABEL_18:
              objc_msgSend(v29, "addObject:", v10);
              v14 = (void *)objc_opt_new();
              v30[0] = MEMORY[0x24BDAC760];
              v30[1] = 3221225472;
              v30[2] = __77__PKPrinterDescription_PrintertoolSideConstruction___calcFinishingTemplates___block_invoke;
              v30[3] = &unk_24E6CD760;
              v27 = v14;
              v31 = v27;
              objc_msgSend(v8, "enumerateAttributes:", v30);
              v15 = v10;
              GetLocalizedNameForOption(v15, CFSTR("FinishingTemplates"));
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v16, "isEqual:", v15))
              {
                -[PKPrinterDescription translations](self, "translations");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("finishing-template.%@"), v15);
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v17, "objectForKey:", v18);
                v19 = (void *)objc_claimAutoreleasedReturnValue();

                if (v19)
                {
                  v20 = v19;

                  v16 = v20;
                }

              }
              if ((objc_msgSend(v16, "isEqual:", v15) & 1) == 0)
              {
                objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", v15, CFSTR("finishingTemplateChoice"), v16, CFSTR("finishingTemplateText"), v27, CFSTR("finishingTemplateOptions"), 0);
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v26, "addObject:", v21);

              }
            }
          }

        }
        v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
      }
      while (v5);
    }

  }
  return v26;
}

void __77__PKPrinterDescription_PrintertoolSideConstruction___calcFinishingTemplates___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if (objc_msgSend(v4, "value_tag") == 52)
  {
    objc_msgSend(v4, "name");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "compare:", CFSTR("media-size")))
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

  }
}

- (id)_calcOutputBins:(const GET_PRINTER_ATTRIBUTES_Response *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;

  v4 = (void *)objc_opt_new();
  Printd_Parameters::_get_OutputBinSupported(&a3->var0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    Printd_Parameters::_get_OutputBinDefault(&a3->var0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    Printd_Parameters::_get_PrinterOutputTray(&a3->var0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __69__PKPrinterDescription_PrintertoolSideConstruction___calcOutputBins___block_invoke;
    v11[3] = &unk_24E6CD788;
    v8 = v6;
    v12 = v8;
    v13 = v7;
    v14 = v4;
    v9 = v7;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v11);

  }
  return v4;
}

void __69__PKPrinterDescription_PrintertoolSideConstruction___calcOutputBins___block_invoke(id *a1, void *a2, unint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  const __CFString *v11;
  id v12;

  v12 = a2;
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "setObject:forKey:", v12, CFSTR("OutputBinChoice"));
  objc_msgSend(v12, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), CFSTR(" "));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "capitalizedString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setObject:forKey:", v7, CFSTR("OutputBinText"));
  if (objc_msgSend(a1[4], "isEqualToString:", v12))
    objc_msgSend(v5, "setObject:forKey:", CFSTR("YES"), CFSTR("DefaultOutputBin"));
  if (objc_msgSend(a1[5], "count") > a3)
  {
    objc_msgSend(a1[5], "objectAtIndexedSubscript:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", "stackingorder=firstToLast;", 26);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "rangeOfData:options:range:", v9, 0, 0, objc_msgSend(v8, "length"));
      if (v10)
        v11 = CFSTR("Normal");
      else
        v11 = CFSTR("Reverse");
      objc_msgSend(v5, "setObject:forKey:", v11, CFSTR("com.apple.pageStackOrder"));

    }
  }
  objc_msgSend(a1[6], "addObject:", v5);

}

- (unint64_t)_calcIdentifyActions:(const GET_PRINTER_ATTRIBUTES_Response *)a3
{
  id v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  Printd_Parameters::_get_IdentifyActionsSupported(&a3->var0);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = 0;
  v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        if (objc_msgSend(v8, "hasPrefix:", CFSTR("display"), (_QWORD)v10))
        {
          v4 |= 1uLL;
        }
        else if (objc_msgSend(v8, "hasPrefix:", CFSTR("flash")))
        {
          v4 |= 2uLL;
        }
        else if (objc_msgSend(v8, "hasPrefix:", CFSTR("sound")))
        {
          v4 |= 4uLL;
        }
        else if (objc_msgSend(v8, "hasPrefix:", CFSTR("speak")))
        {
          v4 |= 8uLL;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  return v4;
}

- (id)_calcSpecialFeedOrientation:(const GET_PRINTER_ATTRIBUTES_Response *)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v16;
  void *v17;
  void *v18;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v20 = (id)objc_opt_new();
  Printd_Parameters::_get_MediaColReady(&a3->var0);
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v22 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v8, "mediaSourceProperties");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          objc_msgSend(v8, "mediaSize");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = v10;
          if (!v10 || (objc_msgSend(v10, "hasValidIntegerTypesForXAndY") & 1) == 0)
            goto LABEL_22;
          v12 = objc_msgSend(v11, "xDimension");
          v13 = objc_msgSend(v11, "yDimension");
          v14 = v13;
          if ((int)v12 < 1 || (int)v13 < 1)
            goto LABEL_22;
          objc_msgSend(v9, "feedDirection");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "feedOrientation");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v16, "compare:", CFSTR("long-edge-first")))
          {
            if (objc_msgSend(v17, "integerValue") == 6)
            {
              if (!v17)
              {
LABEL_21:

LABEL_22:
                goto LABEL_23;
              }
LABEL_19:
              +[PKPaper mediaNameForWidth:height:borderless:simplex:](PKPaper, "mediaNameForWidth:height:borderless:simplex:", v12, v14, 0, 0);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "setObject:forKey:", v17, v18);

            }
            goto LABEL_21;
          }
          if (!v17)
            v17 = &unk_24E6EB0F0;
          goto LABEL_19;
        }
LABEL_23:

      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v5);
  }

  return v20;
}

- (BOOL)_calcPrintScalingSupported:(const GET_PRINTER_ATTRIBUTES_Response *)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  v3 = (void *)MEMORY[0x24BDBCF20];
  Printd_Parameters::_get_PrintScalingSupported(&a3->var0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_24E6EB300);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "intersectsSet:", v6);

  return v7;
}

- (id)_calculateSides:(const GET_PRINTER_ATTRIBUTES_Response *)a3
{
  void *v4;
  _BOOL4 type_has_duplex;
  void *v6;
  const __CFString *v8;
  _QWORD v9[4];

  v9[3] = *MEMORY[0x24BDAC8D0];
  Printd_Parameters::_get_SidesSupported(&a3->var0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v4, "count") <= 1)
  {
    type_has_duplex = self->_type_has_duplex;

    if (!type_has_duplex)
    {
      v8 = CFSTR("one-sided");
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v8, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      return v6;
    }
  }
  else
  {

  }
  self->_type_has_duplex = 1;
  v9[0] = CFSTR("one-sided");
  v9[1] = CFSTR("two-sided-short-edge");
  v9[2] = CFSTR("two-sided-long-edge");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  return v6;
}

- (id)_calculateQuality:(const GET_PRINTER_ATTRIBUTES_Response *)a3
{
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  uint8_t v9[8];
  _QWORD v10[4];
  id v11;

  v4 = (void *)objc_opt_new();
  Printd_Parameters::_get_PrintQualitySupported(&a3->var0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __71__PKPrinterDescription_PrintertoolSideConstruction___calculateQuality___block_invoke;
  v10[3] = &unk_24E6CD7B0;
  v6 = v4;
  v11 = v6;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v10);

  if (!objc_msgSend(v6, "count"))
  {
    _PKLogCategory(PKLogCategoryFramework);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_220F9A000, v7, OS_LOG_TYPE_DEFAULT, "No print-quality-supported attribute found.  Defaulting to normal quality.", v9, 2u);
    }

    objc_msgSend(v6, "addObject:", CFSTR("4"));
  }

  return v6;
}

void __71__PKPrinterDescription_PrintertoolSideConstruction___calculateQuality___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v6 = v3;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), objc_msgSend(v3, "integerValue"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v5);

}

- (id)_calculateFormats:(const GET_PRINTER_ATTRIBUTES_Response *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x24BDBCEF0];
  Printd_Parameters::_get_DocumentFormatSupported(&a3->var0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_24E6EB318);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "intersectSet:", v7);
  if (!objc_msgSend(v6, "count"))
  {
    _PKLogCategory(PKLogCategoryFramework);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_220F9A000, v8, OS_LOG_TYPE_DEFAULT, "No document-format-supported attribute found or no supported formats found.", buf, 2u);
    }

    -[PKPrinterDescription txtRecordObjectForKey:](self, "txtRecordObjectForKey:", CFSTR("pdl"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      objc_msgSend(v9, "lowercaseString", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "componentsSeparatedByString:", CFSTR(","));
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
      if (v13)
      {
        v14 = *(_QWORD *)v22;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v22 != v14)
              objc_enumerationMutation(v12);
            v16 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
            if (objc_msgSend(v7, "containsObject:", v16))
              objc_msgSend(v6, "addObject:", v16);
          }
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
        }
        while (v13);
      }

    }
  }
  +[PKDefaults requiredPDL](PKDefaults, "requiredPDL");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17 && (objc_msgSend(v6, "containsObject:", v17) & 1) == 0)
  {
    _PKLogCategory(PKLogCategoryFramework);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v26 = v17;
      v27 = 2114;
      v28 = v6;
      _os_log_impl(&dword_220F9A000, v18, OS_LOG_TYPE_DEFAULT, "Formats array doesn't contain '%{public}@', which is required; contains: %{public}@",
        buf,
        0x16u);
    }

    v6 = 0;
  }
  objc_msgSend(v6, "allObjects");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)_calculateMediaColSupportedArray:(const GET_PRINTER_ATTRIBUTES_Response *)a3
{
  void *v3;
  NSObject *v4;
  uint8_t v6[16];

  Printd_Parameters::_get_MediaColSupported(&a3->var0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "count"))
  {
    _PKLogCategory(PKLogCategoryFramework);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_220F9A000, v4, OS_LOG_TYPE_DEFAULT, "No mediaColSupported found, defaulting to media-bottom-margin, media-left-margin, media-right-margin, media-size, and media-top-margin.", v6, 2u);
    }

    v3 = &unk_24E6EB330;
  }
  return v3;
}

- (BOOL)wantsComprehensivePaperList
{
  return self->_wantsComprehensivePaperList;
}

- (void)replacePaperList:(id)a3
{
  self->_wantsComprehensivePaperList = 0;
  objc_storeStrong((id *)&self->_paperList, a3);
}

- (id)_calculatePaperList:(const GET_PRINTER_ATTRIBUTES_Response *)a3
{
  void *v4;
  NSObject *v5;
  NSObject *v6;
  uint8_t v8[16];
  uint8_t buf[16];

  +[PKPaperList paperListWithAttrs:translations:](PKPaperList, "paperListWithAttrs:translations:", a3, self->_translations);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    _PKLogCategory(PKLogCategoryDefault[0]);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_220F9A000, v5, OS_LOG_TYPE_DEFAULT, "would like lazily fetched paperlist", buf, 2u);
    }

    self->_wantsComprehensivePaperList = 1;
    +[PKPaperList paperListWithTXTRecord:](PKPaperList, "paperListWithTXTRecord:", self->_txtRecord);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      _PKLogCategory(PKLogCategoryDefault[0]);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl(&dword_220F9A000, v6, OS_LOG_TYPE_ERROR, "Missing txt record sufficent for paper list", v8, 2u);
      }

      v4 = 0;
    }
  }
  return v4;
}

- (id)_calculateOutputModes:(const GET_PRINTER_ATTRIBUTES_Response *)a3
{
  void *v4;
  const __CFString **v5;
  uint64_t v6;
  uint64_t v7;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  Printd_Parameters::_get_PrintColorModeSupported(&a3->var0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "count"))
  {
    if (self->_type_has_color)
    {
      v10 = CFSTR("monochrome");
      v11 = CFSTR("color");
      v5 = &v10;
      v6 = 2;
    }
    else
    {
      v9 = CFSTR("monochrome");
      v5 = &v9;
      v6 = 1;
    }
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, v6, v9, v10, v11, v12);
    v7 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v7;
  }
  return v4;
}

- (id)_calcInputSlots:(const GET_PRINTER_ATTRIBUTES_Response *)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSArray *obj;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)objc_opt_new();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  obj = self->_trays;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v17;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v17 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v7);
        objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "name");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKey:", v10, CFSTR("InputSlotChoice"));

        objc_msgSend(v8, "localizedName");
        v11 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKey:", v11, CFSTR("InputSlotName"));

        objc_msgSend(v8, "mediaName");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v11) = v12 == 0;

        if ((v11 & 1) == 0)
        {
          objc_msgSend(v8, "mediaName");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setObject:forKey:", v13, CFSTR("InputSlotMedia"));

        }
        objc_msgSend(v4, "addObject:", v9);

        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v5);
  }

  return v4;
}

- (id)_calcMediaTypes:(const GET_PRINTER_ATTRIBUTES_Response *)a3
{
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t i;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v17;
  id v19;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _QWORD v25[2];
  _QWORD v26[2];
  _QWORD v27[2];
  _QWORD v28[2];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v19 = (id)objc_opt_new();
  Printd_Parameters::_get_MediaTypeSupported(&a3->var0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v17)
    goto LABEL_19;
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = v17;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (!v4)
  {

LABEL_19:
    v25[0] = CFSTR("MediaTypeChoice");
    v25[1] = CFSTR("MediaTypeName");
    v26[0] = CFSTR("auto");
    v26[1] = CFSTR("auto");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, v25, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "insertObject:atIndex:", v15, 0);

    goto LABEL_20;
  }
  v5 = 0;
  v6 = *(_QWORD *)v22;
  do
  {
    for (i = 0; i != v4; ++i)
    {
      if (*(_QWORD *)v22 != v6)
        objc_enumerationMutation(obj);
      v8 = *(NSString **)(*((_QWORD *)&v21 + 1) + 8 * i);
      GetLocalizedNameForOption(v8, CFSTR("MediaTypeNames"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "isEqual:", v8))
      {
        -[PKPrinterDescription translations](self, "translations");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("media-type.%@"), v8);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKey:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          v13 = v12;

          v9 = v13;
        }

      }
      if ((objc_msgSend(v9, "isEqual:", v8) & 1) == 0)
      {
        v27[0] = CFSTR("MediaTypeChoice");
        v27[1] = CFSTR("MediaTypeName");
        v28[0] = v8;
        v28[1] = v9;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v28, v27, 2);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addObject:", v14);

        if (-[NSString isEqual:](v8, "isEqual:", CFSTR("auto")))
          v5 = 1;
      }

    }
    v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  }
  while (v4);

  if ((v5 & 1) == 0)
    goto LABEL_19;
LABEL_20:

  return v19;
}

- (id)_calcJobPresets:(const GET_PRINTER_ATTRIBUTES_Response *)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v20;
  id obj;
  id v23;
  _QWORD v24[4];
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v23 = (id)objc_opt_new();
  Printd_Parameters::_get_JobPresetsSupported(&a3->var0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v20 = v4;
    obj = v4;
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v27 != v6)
            objc_enumerationMutation(obj);
          v8 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          v9 = (void *)objc_opt_new();
          v24[0] = MEMORY[0x24BDAC760];
          v24[1] = 3221225472;
          v24[2] = __69__PKPrinterDescription_PrintertoolSideConstruction___calcJobPresets___block_invoke;
          v24[3] = &unk_24E6CD760;
          v10 = v9;
          v25 = v10;
          objc_msgSend(v8, "enumerateAttributes:", v24);
          objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("preset-name"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = v11;
          if (v11)
          {
            v13 = v11;
            -[PKPrinterDescription translations](self, "translations");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("job-preset.%@"), v13);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "objectForKey:", v15);
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            v17 = v13;
            if (v16)
            {
              v17 = v16;

            }
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", v17, CFSTR("JobPresetChoice"), v10, CFSTR("JobPresetOption"), 0);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "addObject:", v18);

          }
        }
        v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v5);
    }

    v4 = v20;
  }

  return v23;
}

void __69__PKPrinterDescription_PrintertoolSideConstruction___calcJobPresets___block_invoke(uint64_t a1, void *a2)
{
  PK_ipp_attribute_t *v3;
  void *v4;
  int v5;
  char v6;
  void *v7;
  id v8;
  NSObject *v9;
  PK_ipp_attribute_t *v10;
  void *v11;
  _BYTE v12[32];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  -[PK_ipp_attribute_t name](v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PK_ipp_attribute_t value_tag](v3, "value_tag");
  v6 = v5 - 33;
  if ((v5 - 33) > 0x23)
    goto LABEL_7;
  if (((1 << v6) & 0xB00000000) != 0)
  {
    ippGetIXString(v3, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v7, v4);

    goto LABEL_12;
  }
  if (((1 << v6) & 5) != 0)
  {
    if (objc_msgSend(v4, "compare:", CFSTR("finishings")))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", ippGetIXInteger(v3, 0));
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = v3;
      v11 = (void *)objc_opt_new();
      *(_QWORD *)v12 = MEMORY[0x24BDAC760];
      *(_QWORD *)&v12[8] = 3221225472;
      *(_QWORD *)&v12[16] = ___ZL21convertIPPIntsToArrayP18PK_ipp_attribute_t_block_invoke;
      *(_QWORD *)&v12[24] = &unk_24E6CAF00;
      v8 = v11;
      v13 = v8;
      -[PK_ipp_attribute_t enumerateValues:](v10, "enumerateValues:", v12);

    }
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v8, v4, *(_QWORD *)v12, *(_OWORD *)&v12[8], *(_QWORD *)&v12[24]);

  }
  else
  {
LABEL_7:
    _PKLogCategory(PKLogCategoryFramework);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v12 = 136315650;
      *(_QWORD *)&v12[4] = "-[PKPrinterDescription(PrintertoolSideConstruction) _calcJobPresets:]_block_invoke";
      *(_WORD *)&v12[12] = 1024;
      *(_DWORD *)&v12[14] = v5;
      *(_WORD *)&v12[18] = 2114;
      *(_QWORD *)&v12[20] = v4;
      _os_log_impl(&dword_220F9A000, v9, OS_LOG_TYPE_ERROR, "%s: unhandled valueTag %d for %{public}@", v12, 0x1Cu);
    }

  }
LABEL_12:

}

- (id)_calcDeviceID:(const GET_PRINTER_ATTRIBUTES_Response *)a3
{
  void *v4;

  Printd_Parameters::_get_PrinterDeviceId(&a3->var0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    -[PKPrinterDescription _makePrinterDeviceIDFromTxt](self, "_makePrinterDeviceIDFromTxt");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (int64_t)_calcJobAccountIDSupport:(const GET_PRINTER_ATTRIBUTES_Response *)a3
{
  NSSet *mandatoryJobAttributes;

  mandatoryJobAttributes = self->_mandatoryJobAttributes;
  if (mandatoryJobAttributes
    && -[NSSet containsObject:](mandatoryJobAttributes, "containsObject:", CFSTR("job-account-id")))
  {
    return 1;
  }
  if (!Printd_Parameters::_has_JobAccountIDSupported(&a3->var0))
    return 0;
  if (Printd_Parameters::_get_JobAccountIDSupported(&a3->var0))
    return 2;
  return 0;
}

- (void)_calcPrinterDriverInfo:(const GET_PRINTER_ATTRIBUTES_Response *)a3
{
  void *v4;
  char v5;
  NSSet *v6;
  NSSet *attrs_document_format_supported;
  NSSet *v8;
  NSSet *attrs_printer_native_formats;
  id v10;
  NSString *v11;
  NSObject *driverformat;
  uint8_t v13[8];
  _BYTE v14[2040];
  id v15;
  __int128 v16;
  __int128 v17;
  id v18;

  v18 = 0;
  v16 = 0u;
  v17 = 0u;
  bzero(v14, 0x838uLL);
  *(_QWORD *)&v16 = -[PKPrinterDescription printer_type_from_cups_scalar](self, "printer_type_from_cups_scalar");
  -[PKPrinterDescription dids](self, "dids");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = liteFigureOutDriverSetupInfo((uint64_t)&v16, (uint64_t)v14, v4);

  if ((v5 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", *((_QWORD *)&v16 + 1));
    v6 = (NSSet *)objc_claimAutoreleasedReturnValue();
    attrs_document_format_supported = self->_attrs_document_format_supported;
    self->_attrs_document_format_supported = v6;

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", (_QWORD)v17);
    v8 = (NSSet *)objc_claimAutoreleasedReturnValue();
    attrs_printer_native_formats = self->_attrs_printer_native_formats;
    self->_attrs_printer_native_formats = v8;

    objc_storeStrong((id *)&self->_attrs_media_source_supported, *((id *)&v17 + 1));
    v10 = v18;
    self->_printer_type_from_cups_scalar = v16;
    v11 = (NSString *)v10;
    driverformat = self->_driverformat;
    self->_driverformat = v11;
  }
  else
  {
    _PKLogCategory(PKLogCategoryProgress[0]);
    driverformat = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(driverformat, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_220F9A000, driverformat, OS_LOG_TYPE_ERROR, "Driver initialization failed.", v13, 2u);
    }
  }

}

- (id)_makePrinterDeviceIDFromTxt
{
  uint64_t v2;
  uint64_t v3;
  const __CFString *v4;
  const __CFString *v5;
  const char *v6;
  int AppBooleanValue;
  int v8;
  NSArray *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  char v15;
  const char *v16;
  char v17;
  char v18;
  char v19;
  char v20;
  int v21;
  uint64_t v22;
  const __CFString *v23;
  void *v24;
  BOOL v25;
  uint64_t v26;
  void *v27;
  __CFString *v29;
  __CFString *v30;
  void *v32;
  __CFString *v33;
  __CFString *v34;
  const __CFString *v35;
  id v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  char v42[128];
  char __str[1024];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  -[PKPrinterDescription txtRecordObjectForKey:](self, "txtRecordObjectForKey:", CFSTR("URF"));
  v35 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  -[PKPrinterDescription txtRecordObjectForKey:](self, "txtRecordObjectForKey:", CFSTR("usb_MFG"));
  v33 = (__CFString *)objc_claimAutoreleasedReturnValue();
  -[PKPrinterDescription txtRecordObjectForKey:](self, "txtRecordObjectForKey:", CFSTR("usb_MDL"));
  v2 = objc_claimAutoreleasedReturnValue();
  -[PKPrinterDescription txtRecordObjectForKey:](self, "txtRecordObjectForKey:", CFSTR("product"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (v33 || !v32)
    goto LABEL_12;
  if (objc_msgSend(v32, "rangeOfString:options:", CFSTR("DesignJet"), 1) == 0x7FFFFFFFFFFFFFFFLL
    && objc_msgSend(v32, "rangeOfString:options:", CFSTR("DeskJet"), 1) == 0x7FFFFFFFFFFFFFFFLL
    && objc_msgSend(v32, "rangeOfString:options:", CFSTR("LaserJet"), 1) == 0x7FFFFFFFFFFFFFFFLL)
  {
    v33 = CFSTR("HP");
    if (objc_msgSend(v32, "rangeOfString:options:", CFSTR("Photosmart"), 1) != 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_12;
    v3 = objc_msgSend(v32, "rangeOfString:options:", CFSTR("OfficeJet"), 1);
    v4 = CFSTR("HP");
    if (v3 == 0x7FFFFFFFFFFFFFFFLL)
      v4 = CFSTR("Unknown");
  }
  else
  {
    v4 = CFSTR("HP");
  }
  v33 = (__CFString *)v4;
LABEL_12:
  if (v2)
    v5 = (const __CFString *)v2;
  else
    v5 = CFSTR("Unknown");
  v30 = (__CFString *)v5;
  if (!v2 && v32)
    v30 = v32;
  v34 = objc_retainAutorelease(v33);
  v6 = (const char *)-[__CFString UTF8String](v34, "UTF8String");
  v29 = objc_retainAutorelease(v30);
  snprintf(__str, 0x400uLL, "MFG:%s;MDL:%s;CMD", v6, (const char *)-[__CFString UTF8String](v29, "UTF8String"));
  if (-[PKPrinterDescription(PrintertoolSideConstruction) _makePrinterDeviceIDFromTxt]::alwaysURF_valid)
  {
    if (-[PKPrinterDescription(PrintertoolSideConstruction) _makePrinterDeviceIDFromTxt]::alwaysURF)
    {
LABEL_20:
      strlcat(__str, ":URF", 0x400uLL);
      goto LABEL_42;
    }
  }
  else
  {
    AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("PrintKitAlwaysURF"), CFSTR(".GlobalPreferences"), (Boolean *)&-[PKPrinterDescription(PrintertoolSideConstruction) _makePrinterDeviceIDFromTxt]::alwaysURF_valid);
    if (-[PKPrinterDescription(PrintertoolSideConstruction) _makePrinterDeviceIDFromTxt]::alwaysURF_valid)
      v8 = AppBooleanValue;
    else
      v8 = 0;
    -[PKPrinterDescription(PrintertoolSideConstruction) _makePrinterDeviceIDFromTxt]::alwaysURF = v8;
    -[PKPrinterDescription(PrintertoolSideConstruction) _makePrinterDeviceIDFromTxt]::alwaysURF_valid = 1;
    if (v8)
      goto LABEL_20;
  }
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v9 = self->_formats;
  v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
  if (v10)
  {
    v11 = ":";
    v12 = *(_QWORD *)v39;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v39 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v13);
        strlcat(__str, v11, 0x400uLL);
        v15 = objc_msgSend(v14, "isEqual:", CFSTR("image/jpeg"));
        v16 = "JPEG";
        if ((v15 & 1) != 0)
          goto LABEL_36;
        v17 = objc_msgSend(v14, "isEqual:", CFSTR("application/pdf"));
        v16 = "PDF";
        if ((v17 & 1) != 0)
          goto LABEL_36;
        v18 = objc_msgSend(v14, "isEqual:", CFSTR("image/png"));
        v16 = "PNG";
        if ((v18 & 1) != 0
          || (v19 = objc_msgSend(v14, "isEqual:", CFSTR("application/postscript")), v16 = "PS", (v19 & 1) != 0)
          || (v20 = objc_msgSend(v14, "isEqual:", CFSTR("application/vnd.hp-pcl")), v16 = "PCL", (v20 & 1) != 0)
          || (v21 = objc_msgSend(v14, "isEqual:", CFSTR("image/urf")), v16 = "URF", v21))
        {
LABEL_36:
          strlcat(__str, v16, 0x400uLL);
        }
        else
        {
          strlcat(__str, (const char *)objc_msgSend(objc_retainAutorelease(v14), "UTF8String"), 0x400uLL);
        }
        ++v13;
        v11 = ",";
      }
      while (v10 != v13);
      v22 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
      v10 = v22;
      v11 = ",";
    }
    while (v22);
  }

LABEL_42:
  strlcat(__str, ";", 0x400uLL);
  v23 = v35;
  if (!v35)
    v23 = CFSTR("CP1,RS300,W8,SRGB24");
  v36 = (id)v23;
  -[PKPrinterDescription txtRecordObjectForKey:](self, "txtRecordObjectForKey:", CFSTR("printer-type"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v24 == 0;

  if (!v25)
  {
    objc_msgSend(v36, "stringByReplacingOccurrencesOfString:withString:", CFSTR("CP1,"), CFSTR("CP255,"));
    v26 = objc_claimAutoreleasedReturnValue();

    v36 = (id)v26;
  }
  strlcat(__str, "URF:", 0x400uLL);
  v37 = objc_retainAutorelease(v36);
  strlcat(__str, (const char *)objc_msgSend(v37, "UTF8String"), 0x400uLL);
  strlcat(__str, ";", 0x400uLL);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", __str);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

- (id)txtRecordObjectForKey:(id)a3
{
  NSDictionary *txtRecord;
  void *v4;
  void *v5;

  txtRecord = self->_txtRecord;
  objc_msgSend(a3, "lowercaseString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKey:](txtRecord, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_ingestTxtRecord:(id)a3
{
  void *v4;
  NSDictionary *v5;
  NSDictionary *txtRecord;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  NSDictionary *v12;

  v10 = a3;
  v4 = (void *)objc_opt_new();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = ___ZL20ensureLowercasedKeysP12NSDictionaryIP8NSStringS1_E_block_invoke;
  v11[3] = &unk_24E6CD6C0;
  v5 = v4;
  v12 = v5;
  objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v11);

  txtRecord = self->_txtRecord;
  self->_txtRecord = v5;

  -[PKPrinterDescription txtRecordObjectForKey:](self, "txtRecordObjectForKey:", CFSTR("Color"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPrinterDescription txtRecordObjectForKey:](self, "txtRecordObjectForKey:", CFSTR("Duplex"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPrinterDescription txtRecordObjectForKey:](self, "txtRecordObjectForKey:", CFSTR("product"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && (objc_msgSend(v7, "isEqual:", CFSTR("T")) & 1) != 0
    || v9 && objc_msgSend(v9, "rangeOfString:", CFSTR("Color")) != 0x7FFFFFFFFFFFFFFFLL)
  {
    self->_type_has_color = 1;
  }
  if (v8 && objc_msgSend(v8, "isEqual:", CFSTR("T")))
    self->_type_has_duplex = 1;

}

- (void)_ingestAttrs:(const GET_PRINTER_ATTRIBUTES_Response *)a3
{
  void *v5;
  void *v6;
  NSSet *v7;
  NSSet *jpegFeatures;
  void *v9;
  void *v10;
  NSSet *v11;
  NSSet *mandatoryJobAttributes;
  __CFString *v13;
  __CFString *v14;
  NSArray *v15;
  NSArray *orientations;
  NSDictionary *v17;
  NSDictionary *specialFeedOrientation;
  NSArray *v19;
  NSArray *sides;
  NSArray *v21;
  NSArray *quality;
  NSArray *v23;
  NSArray *formats;
  NSArray *v25;
  NSArray *mediaColSupportedArray;
  void *v27;
  PKPaperList *v28;
  PKPaperList *paperList;
  NSArray *v30;
  NSArray *outputModes;
  NSArray *v32;
  NSArray *finishings;
  NSArray *v34;
  NSArray *finishingTemplates;
  NSArray *v36;
  NSArray *outputBins;
  void *v38;
  void *v39;
  NSArray *v40;
  NSArray *trays;
  NSArray *v42;
  NSArray *inputSlots;
  NSArray *v44;
  NSArray *mediaTypes;
  NSArray *v46;
  NSArray *jobPresets;
  NSURL *v48;
  NSURL *printerInfoURL;
  NSURL *v50;
  NSURL *suppliesInfoURL;
  NSURL *v52;
  NSURL *quotaManagementURL;
  NSString *v54;
  NSString *deviceID;
  NSString *v56;
  NSDictionary *v57;
  NSDictionary **p_dids;
  NSDictionary *dids;
  void *v60;
  BOOL v61;
  void *v62;
  BOOL v63;
  uint64_t v64;
  _QWORD v65[3];

  v65[2] = *MEMORY[0x24BDAC8D0];
  if (Printd_Parameters::_has_CopiesSupported(&a3->var0))
  {
    Printd_Parameters::_get_CopiesSupported(&a3->var0, &v64);
    if (SHIDWORD(v64) >= 2)
      self->_printer_type_from_cups_scalar |= 4uLL;
  }
  if (Printd_Parameters::_has_JpegFeaturesSupported(&a3->var0))
  {
    v5 = (void *)MEMORY[0x24BDBCF20];
    Printd_Parameters::_get_JpegFeaturesSupported(&a3->var0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setWithArray:", v6);
    v7 = (NSSet *)objc_claimAutoreleasedReturnValue();
    jpegFeatures = self->_jpegFeatures;
    self->_jpegFeatures = v7;

  }
  v9 = (void *)MEMORY[0x24BDBCF20];
  Printd_Parameters::_get_PrinterMandatoryJobAttributes(&a3->var0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWithArray:", v10);
  v11 = (NSSet *)objc_claimAutoreleasedReturnValue();
  mandatoryJobAttributes = self->_mandatoryJobAttributes;
  self->_mandatoryJobAttributes = v11;

  self->_documentPasswordSupported = 0;
  if (Printd_Parameters::_has_DocumentPasswordSupported(&a3->var0))
    self->_documentPasswordSupported = Printd_Parameters::_has_DocumentPasswordSupported(&a3->var0);
  self->_jobAccountIDSupport = -[PKPrinterDescription _calcJobAccountIDSupport:](self, "_calcJobAccountIDSupport:", a3);
  if (Printd_Parameters::_has_PdfKOctetsSupported(&a3->var0))
  {
    Printd_Parameters::_get_PdfKOctetsSupported(&a3->var0, &v64);
    self->_max_pdf = HIDWORD(v64);
  }
  if (Printd_Parameters::_has_JpegKOctetsSupported(&a3->var0))
  {
    Printd_Parameters::_get_JpegKOctetsSupported(&a3->var0, &v64);
    self->_max_jpeg = HIDWORD(v64);
  }
  if (Printd_Parameters::_has_JpegXDimensionSupported(&a3->var0))
  {
    Printd_Parameters::_get_JpegXDimensionSupported(&a3->var0, &v64);
    self->_max_jpeg_x = HIDWORD(v64);
  }
  if (Printd_Parameters::_has_JpegYDimensionSupported(&a3->var0))
  {
    Printd_Parameters::_get_JpegYDimensionSupported(&a3->var0, &v64);
    self->_max_jpeg_y = HIDWORD(v64);
  }
  self->_preferred_landscape = 4;
  v13 = CFSTR("4");
  if (Printd_Parameters::_has_LandscapeOrientationRequestedPreferred(&a3->var0)
    && Printd_Parameters::_get_LandscapeOrientationRequestedPreferred(&a3->var0) == 5)
  {
    v14 = CFSTR("5");

    self->_preferred_landscape = 5;
    v13 = v14;
  }
  v65[0] = CFSTR("3");
  v65[1] = v13;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v65, 2);
  v15 = (NSArray *)objc_claimAutoreleasedReturnValue();
  orientations = self->_orientations;
  self->_orientations = v15;

  -[PKPrinterDescription _calcSpecialFeedOrientation:](self, "_calcSpecialFeedOrientation:", a3);
  v17 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  specialFeedOrientation = self->_specialFeedOrientation;
  self->_specialFeedOrientation = v17;

  self->_print_scaling_supported = -[PKPrinterDescription _calcPrintScalingSupported:](self, "_calcPrintScalingSupported:", a3);
  -[PKPrinterDescription _calculateSides:](self, "_calculateSides:", a3);
  v19 = (NSArray *)objc_claimAutoreleasedReturnValue();
  sides = self->_sides;
  self->_sides = v19;

  -[PKPrinterDescription _calculateQuality:](self, "_calculateQuality:", a3);
  v21 = (NSArray *)objc_claimAutoreleasedReturnValue();
  quality = self->_quality;
  self->_quality = v21;

  -[PKPrinterDescription _calculateFormats:](self, "_calculateFormats:", a3);
  v23 = (NSArray *)objc_claimAutoreleasedReturnValue();
  formats = self->_formats;
  self->_formats = v23;

  -[PKPrinterDescription _calculateMediaColSupportedArray:](self, "_calculateMediaColSupportedArray:", a3);
  v25 = (NSArray *)objc_claimAutoreleasedReturnValue();
  mediaColSupportedArray = self->_mediaColSupportedArray;
  self->_mediaColSupportedArray = v25;

  Printd_Parameters::_get_PrintColorModeSupported(&a3->var0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  self->_supportsPrintColorMode = objc_msgSend(v27, "count") != 0;

  -[PKPrinterDescription _calculatePaperList:](self, "_calculatePaperList:", a3);
  v28 = (PKPaperList *)objc_claimAutoreleasedReturnValue();
  paperList = self->_paperList;
  self->_paperList = v28;

  -[PKPrinterDescription _calculateOutputModes:](self, "_calculateOutputModes:", a3);
  v30 = (NSArray *)objc_claimAutoreleasedReturnValue();
  outputModes = self->_outputModes;
  self->_outputModes = v30;

  Printd_Parameters::_get_FinishingsSupported(&a3->var0);
  v32 = (NSArray *)objc_claimAutoreleasedReturnValue();
  finishings = self->_finishings;
  self->_finishings = v32;

  -[PKPrinterDescription _calcFinishingTemplates:](self, "_calcFinishingTemplates:", a3);
  v34 = (NSArray *)objc_claimAutoreleasedReturnValue();
  finishingTemplates = self->_finishingTemplates;
  self->_finishingTemplates = v34;

  -[PKPrinterDescription _calcOutputBins:](self, "_calcOutputBins:", a3);
  v36 = (NSArray *)objc_claimAutoreleasedReturnValue();
  outputBins = self->_outputBins;
  self->_outputBins = v36;

  Printd_Parameters::_get_MediaSourceSupported(&a3->var0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  Printd_Parameters::_get_PrinterInputTray(&a3->var0);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKTray traysWithMediaSourceSupported:printerInputTrays:](PKTray, "traysWithMediaSourceSupported:printerInputTrays:", v38, v39);
  v40 = (NSArray *)objc_claimAutoreleasedReturnValue();
  trays = self->_trays;
  self->_trays = v40;

  -[PKPrinterDescription _calcInputSlots:](self, "_calcInputSlots:", a3);
  v42 = (NSArray *)objc_claimAutoreleasedReturnValue();
  inputSlots = self->_inputSlots;
  self->_inputSlots = v42;

  -[PKPrinterDescription _calcMediaTypes:](self, "_calcMediaTypes:", a3);
  v44 = (NSArray *)objc_claimAutoreleasedReturnValue();
  mediaTypes = self->_mediaTypes;
  self->_mediaTypes = v44;

  -[PKPrinterDescription _calcJobPresets:](self, "_calcJobPresets:", a3);
  v46 = (NSArray *)objc_claimAutoreleasedReturnValue();
  jobPresets = self->_jobPresets;
  self->_jobPresets = v46;

  Printd_Parameters::_get_PrinterMoreInfo(&a3->var0);
  v48 = (NSURL *)objc_claimAutoreleasedReturnValue();
  printerInfoURL = self->_printerInfoURL;
  self->_printerInfoURL = v48;

  Printd_Parameters::_get_PrinterSupplyInfoURI(&a3->var0);
  v50 = (NSURL *)objc_claimAutoreleasedReturnValue();
  suppliesInfoURL = self->_suppliesInfoURL;
  self->_suppliesInfoURL = v50;

  Printd_Parameters::_get_PrinterChargeInfoUri(&a3->var0);
  v52 = (NSURL *)objc_claimAutoreleasedReturnValue();
  quotaManagementURL = self->_quotaManagementURL;
  self->_quotaManagementURL = v52;

  self->_identifyActions = -[PKPrinterDescription _calcIdentifyActions:](self, "_calcIdentifyActions:", a3);
  -[PKPrinterDescription _calcDeviceID:](self, "_calcDeviceID:", a3);
  v54 = (NSString *)objc_claimAutoreleasedReturnValue();
  deviceID = self->_deviceID;
  self->_deviceID = v54;

  v56 = self->_deviceID;
  if (v56)
  {
    _cupsGet1284Values(v56);
    v57 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    p_dids = &self->_dids;
    dids = self->_dids;
    self->_dids = v57;
  }
  else
  {
    p_dids = &self->_dids;
    dids = self->_dids;
    self->_dids = 0;
  }

  -[NSDictionary objectForKey:](*p_dids, "objectForKey:", CFSTR("TEST-PIN-REQUIRED"));
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = v60 == 0;

  if (!v61)
    self->_pin_required = 1;
  -[PKPrinterDescription _calcPrinterDriverInfo:](self, "_calcPrinterDriverInfo:", a3);
  -[NSDictionary objectForKey:](*p_dids, "objectForKey:", CFSTR("TEST-FAX"));
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = v62 == 0;

  if (!v63)
    self->_printer_type_from_cups_scalar |= 0x80uLL;

}

@end
