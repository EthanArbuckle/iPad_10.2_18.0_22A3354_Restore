@implementation CLSJunkClassificationModel

- (CLSJunkClassificationModel)initWithSceneAnalysisVersion:(unint64_t)a3
{
  CLSJunkClassificationModel *v4;
  CLSJunkClassificationModel *v5;
  uint64_t v6;
  objc_super v8;
  uint8_t buf[4];
  int v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8.receiver = self;
  v8.super_class = (Class)CLSJunkClassificationModel;
  v4 = -[CLSJunkClassificationModel init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    if (a3 < 0x56)
    {
      if (a3 < 0x51)
      {
        if (a3 < 0x28)
        {
          if (a3 < 0x20)
          {
            if (a3 == 31)
            {
              -[CLSJunkClassificationModel setupVersion31](v4, "setupVersion31");
            }
            else
            {
              if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
              {
                v6 = objc_opt_class();
                *(_DWORD *)buf = 67109378;
                v10 = a3;
                v11 = 2112;
                v12 = v6;
                _os_log_impl(&dword_244052000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Unsupported version %d in %@", buf, 0x12u);
              }

              return 0;
            }
          }
          else
          {
            -[CLSJunkClassificationModel setupVersion32](v4, "setupVersion32");
          }
        }
        else
        {
          -[CLSJunkClassificationModel setupVersion40](v4, "setupVersion40");
        }
      }
      else
      {
        -[CLSJunkClassificationModel setupVersion81](v4, "setupVersion81");
      }
    }
    else
    {
      -[CLSJunkClassificationModel setupVersion86](v4, "setupVersion86");
    }
  }
  return v5;
}

- (id)initForTesting
{
  return -[CLSJunkClassificationModel initWithSceneAnalysisVersion:](self, "initWithSceneAnalysisVersion:", 86);
}

- (void)setupVersion31
{
  CLSSignalNode *v3;
  CLSSignalNode *negativeNode;
  CLSSignalNode *v5;
  CLSSignalNode *nonMemorableNode;
  CLSSignalNode *v7;
  CLSSignalNode *poorQualityNode;
  CLSSignalNode *v9;
  CLSSignalNode *textDocumentNode;
  CLSSignalNode *v11;
  CLSSignalNode *tragicFailureNode;
  CLSSignalNode *v13;
  CLSSignalNode *tragicFailureInternalNode;
  CLSSignalNode *v15;
  CLSSignalNode *screenshotNode;
  CLSSignalNode *v17;
  CLSSignalNode *badFramingNode;
  CLSSignalNode *v19;
  CLSSignalNode *badLightingNode;
  CLSSignalNode *v21;
  CLSSignalNode *blurryNode;
  CLSSignalNode *v23;
  CLSSignalNode *foodOrDrinkNode;
  CLSSignalNode *v25;
  CLSSignalNode *otherNode;
  CLSSignalNode *v27;
  CLSSignalNode *medicalReferenceNode;
  CLSSignalNode *v29;
  CLSSignalNode *negativeInternalNode;
  CLSSignalNode *v31;
  CLSSignalNode *receiptOrDocumentNode;
  CLSSignalNode *v33;
  CLSSignalNode *repairReferenceNode;
  CLSSignalNode *v35;
  CLSSignalNode *shoppingReferenceNode;
  CLSSignalNode *v37;
  CLSSignalNode *utilityReferenceNode;
  CLSSignalNode *v39;
  CLSSignalNode *legacyNode;

  self->_version = 31;
  v3 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147483644, CFSTR("Junk - Negative"), 0.54, 0.54, 0.54);
  negativeNode = self->_negativeNode;
  self->_negativeNode = v3;

  v5 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147483645, CFSTR("Junk - Non Memorable"), 0.675, 0.675, 0.675);
  nonMemorableNode = self->_nonMemorableNode;
  self->_nonMemorableNode = v5;

  v7 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147483646, CFSTR("Junk - Poor Quality"), 0.62, 0.62, 0.62);
  poorQualityNode = self->_poorQualityNode;
  self->_poorQualityNode = v7;

  v9 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147483629, CFSTR("Junk - Text Document"), 0.0, 0.0, 0.0);
  textDocumentNode = self->_textDocumentNode;
  self->_textDocumentNode = v9;

  v11 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147483631, CFSTR("Junk - Tragic Failure"), 0.92, 0.92, 0.92);
  tragicFailureNode = self->_tragicFailureNode;
  self->_tragicFailureNode = v11;

  v13 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147483630, CFSTR("Junk - Tragic Failure Internal"), 0.77, 0.77, 0.77);
  tragicFailureInternalNode = self->_tragicFailureInternalNode;
  self->_tragicFailureInternalNode = v13;

  v15 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147483632, CFSTR("Junk - Screenshot"), 0.84, 0.84, 0.84);
  screenshotNode = self->_screenshotNode;
  self->_screenshotNode = v15;

  v17 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147483633, CFSTR("Junk - Bad Framing"), 0.0, 0.0, 0.0);
  badFramingNode = self->_badFramingNode;
  self->_badFramingNode = v17;

  v19 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147483634, CFSTR("Junk - Bad Lighting"), 0.0, 0.0, 0.0);
  badLightingNode = self->_badLightingNode;
  self->_badLightingNode = v19;

  v21 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147483635, CFSTR("Junk - Blurry"), 0.0, 0.0, 0.0);
  blurryNode = self->_blurryNode;
  self->_blurryNode = v21;

  v23 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147483636, CFSTR("Junk - Food or Drink"), 0.0, 0.0, 0.0);
  foodOrDrinkNode = self->_foodOrDrinkNode;
  self->_foodOrDrinkNode = v23;

  v25 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147483637, CFSTR("Junk - Other"), 0.0, 0.0, 0.0);
  otherNode = self->_otherNode;
  self->_otherNode = v25;

  v27 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147483638, CFSTR("Junk - Medical Reference"), 0.0, 0.0, 0.0);
  medicalReferenceNode = self->_medicalReferenceNode;
  self->_medicalReferenceNode = v27;

  v29 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147483639, CFSTR("Junk - Negative Internal"), 0.0, 0.0, 0.0);
  negativeInternalNode = self->_negativeInternalNode;
  self->_negativeInternalNode = v29;

  v31 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147483640, CFSTR("Junk - Receipt or Document"), 0.71, 0.71, 0.71);
  receiptOrDocumentNode = self->_receiptOrDocumentNode;
  self->_receiptOrDocumentNode = v31;

  v33 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147483641, CFSTR("Junk - Repair Reference"), 0.0, 0.0, 0.0);
  repairReferenceNode = self->_repairReferenceNode;
  self->_repairReferenceNode = v33;

  v35 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147483642, CFSTR("Junk - Shopping Reference"), 0.0, 0.0, 0.0);
  shoppingReferenceNode = self->_shoppingReferenceNode;
  self->_shoppingReferenceNode = v35;

  v37 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147483643, CFSTR("Junk - Utility Reference"), 0.0, 0.0, 0.0);
  utilityReferenceNode = self->_utilityReferenceNode;
  self->_utilityReferenceNode = v37;

  v39 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 0x7FFFFFFFLL, CFSTR("Junk - Legacy"), 0.1, 0.1, 0.1);
  legacyNode = self->_legacyNode;
  self->_legacyNode = v39;

}

- (void)setupVersion32
{
  CLSSignalNode *v3;
  CLSSignalNode *textDocumentNode;

  -[CLSJunkClassificationModel setupVersion31](self, "setupVersion31");
  self->_version = 32;
  v3 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147483629, CFSTR("Junk - Text Document"), 0.0, 0.0, 0.0);
  textDocumentNode = self->_textDocumentNode;
  self->_textDocumentNode = v3;

}

- (void)setupVersion40
{
  CLSSignalNode *v3;
  CLSSignalNode *negativeNode;
  CLSSignalNode *v5;
  CLSSignalNode *nonMemorableNode;
  CLSSignalNode *v7;
  CLSSignalNode *poorQualityNode;
  CLSSignalNode *v9;
  CLSSignalNode *textDocumentNode;
  CLSSignalNode *v11;
  CLSSignalNode *tragicFailureNode;
  CLSSignalNode *v13;
  CLSSignalNode *tragicFailureInternalNode;
  CLSSignalNode *v15;
  CLSSignalNode *screenshotNode;
  CLSSignalNode *v17;
  CLSSignalNode *badFramingNode;
  CLSSignalNode *v19;
  CLSSignalNode *badLightingNode;
  CLSSignalNode *v21;
  CLSSignalNode *blurryNode;
  CLSSignalNode *v23;
  CLSSignalNode *foodOrDrinkNode;
  CLSSignalNode *v25;
  CLSSignalNode *otherNode;
  CLSSignalNode *v27;
  CLSSignalNode *medicalReferenceNode;
  CLSSignalNode *v29;
  CLSSignalNode *negativeInternalNode;
  CLSSignalNode *v31;
  CLSSignalNode *receiptOrDocumentNode;
  CLSSignalNode *v33;
  CLSSignalNode *repairReferenceNode;
  CLSSignalNode *v35;
  CLSSignalNode *shoppingReferenceNode;
  CLSSignalNode *v37;
  CLSSignalNode *utilityReferenceNode;

  self->_version = 40;
  v3 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147483644, CFSTR("Junk - Negative"), 0.04, 0.2);
  negativeNode = self->_negativeNode;
  self->_negativeNode = v3;

  v5 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147483645, CFSTR("Junk - Non Memorable"), 0.83, 0.94, 0.58);
  nonMemorableNode = self->_nonMemorableNode;
  self->_nonMemorableNode = v5;

  v7 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147483646, CFSTR("Junk - Poor Quality"), 0.76, 0.85, 0.26);
  poorQualityNode = self->_poorQualityNode;
  self->_poorQualityNode = v7;

  v9 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147483629, CFSTR("Junk - Text Document"), 0.81, 0.86, 0.51);
  textDocumentNode = self->_textDocumentNode;
  self->_textDocumentNode = v9;

  v11 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147483631, CFSTR("Junk - Tragic Failure"), 0.11, 0.34, 0.05);
  tragicFailureNode = self->_tragicFailureNode;
  self->_tragicFailureNode = v11;

  v13 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147483630, CFSTR("Junk - Tragic Failure Internal"), 0.09, 0.21, 0.04);
  tragicFailureInternalNode = self->_tragicFailureInternalNode;
  self->_tragicFailureInternalNode = v13;

  v15 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147483632, CFSTR("Junk - Screenshot"), 0.47, 0.91, 0.18);
  screenshotNode = self->_screenshotNode;
  self->_screenshotNode = v15;

  v17 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147483633, CFSTR("Junk - Bad Framing"), 0.12, 0.19, 0.08);
  badFramingNode = self->_badFramingNode;
  self->_badFramingNode = v17;

  v19 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147483634, CFSTR("Junk - Bad Lighting"), 0.28, 0.56, 0.14);
  badLightingNode = self->_badLightingNode;
  self->_badLightingNode = v19;

  v21 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147483635, CFSTR("Junk - Blurry"), 0.41, 0.69, 0.37);
  blurryNode = self->_blurryNode;
  self->_blurryNode = v21;

  v23 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147483636, CFSTR("Junk - Food or Drink"), 0.07, 0.3, 0.03);
  foodOrDrinkNode = self->_foodOrDrinkNode;
  self->_foodOrDrinkNode = v23;

  v25 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147483637, CFSTR("Junk - Other"), 0.0, 0.0, 0.0);
  otherNode = self->_otherNode;
  self->_otherNode = v25;

  v27 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147483638, CFSTR("Junk - Medical Reference"), 0.19, 0.25, 0.07);
  medicalReferenceNode = self->_medicalReferenceNode;
  self->_medicalReferenceNode = v27;

  v29 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147483639, CFSTR("Junk - Negative Internal"), 0.04, 0.12, 0.02);
  negativeInternalNode = self->_negativeInternalNode;
  self->_negativeInternalNode = v29;

  v31 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147483640, CFSTR("Junk - Receipt or Document"), 0.69, 0.8, 0.3);
  receiptOrDocumentNode = self->_receiptOrDocumentNode;
  self->_receiptOrDocumentNode = v31;

  v33 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147483641, CFSTR("Junk - Repair Reference"), 0.15, 0.3, 0.05);
  repairReferenceNode = self->_repairReferenceNode;
  self->_repairReferenceNode = v33;

  v35 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147483642, CFSTR("Junk - Shopping Reference"), 0.52, 0.57, 0.21);
  shoppingReferenceNode = self->_shoppingReferenceNode;
  self->_shoppingReferenceNode = v35;

  v37 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147483643, CFSTR("Junk - Utility Reference"), 0.39, 0.7, 0.27);
  utilityReferenceNode = self->_utilityReferenceNode;
  self->_utilityReferenceNode = v37;

}

- (void)setupVersion81
{
  CLSSignalNode *v3;
  CLSSignalNode *negativeNode;
  CLSSignalNode *v5;
  CLSSignalNode *nonMemorableNode;
  CLSSignalNode *v7;
  CLSSignalNode *poorQualityNode;
  CLSSignalNode *v9;
  CLSSignalNode *textDocumentNode;
  CLSSignalNode *v11;
  CLSSignalNode *tragicFailureNode;
  CLSSignalNode *v13;
  CLSSignalNode *tragicFailureInternalNode;
  CLSSignalNode *v15;
  CLSSignalNode *screenshotNode;
  CLSSignalNode *v17;
  CLSSignalNode *badFramingNode;
  CLSSignalNode *v19;
  CLSSignalNode *badLightingNode;
  CLSSignalNode *v21;
  CLSSignalNode *blurryNode;
  CLSSignalNode *v23;
  CLSSignalNode *foodOrDrinkNode;
  CLSSignalNode *v25;
  CLSSignalNode *otherNode;
  CLSSignalNode *v27;
  CLSSignalNode *medicalReferenceNode;
  CLSSignalNode *v29;
  CLSSignalNode *negativeInternalNode;
  CLSSignalNode *v31;
  CLSSignalNode *receiptOrDocumentNode;
  CLSSignalNode *v33;
  CLSSignalNode *repairReferenceNode;
  CLSSignalNode *v35;
  CLSSignalNode *shoppingReferenceNode;
  CLSSignalNode *v37;
  CLSSignalNode *utilityReferenceNode;

  self->_version = 81;
  v3 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147483644, CFSTR("Junk - Negative"), 0.2, 0.3, 0.09);
  negativeNode = self->_negativeNode;
  self->_negativeNode = v3;

  v5 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147483645, CFSTR("Junk - Non Memorable"), 0.48, 0.65, 0.27);
  nonMemorableNode = self->_nonMemorableNode;
  self->_nonMemorableNode = v5;

  v7 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147483646, CFSTR("Junk - Poor Quality"), 0.65, 0.82, 0.33);
  poorQualityNode = self->_poorQualityNode;
  self->_poorQualityNode = v7;

  v9 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147483629, CFSTR("Junk - Text Document"), 0.57, 0.77, 0.3);
  textDocumentNode = self->_textDocumentNode;
  self->_textDocumentNode = v9;

  v11 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147483631, CFSTR("Junk - Tragic Failure"), 0.07, 0.13, 0.05);
  tragicFailureNode = self->_tragicFailureNode;
  self->_tragicFailureNode = v11;

  v13 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147483630, CFSTR("Junk - Tragic Failure Internal"), 0.07, 0.13, 0.05);
  tragicFailureInternalNode = self->_tragicFailureInternalNode;
  self->_tragicFailureInternalNode = v13;

  v15 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147483632, CFSTR("Junk - Screenshot"), 0.38, 0.62, 0.33);
  screenshotNode = self->_screenshotNode;
  self->_screenshotNode = v15;

  v17 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147483633, CFSTR("Junk - Bad Framing"), 0.15, 0.34, 0.1);
  badFramingNode = self->_badFramingNode;
  self->_badFramingNode = v17;

  v19 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147483634, CFSTR("Junk - Bad Lighting"), 0.16, 0.61, 0.08);
  badLightingNode = self->_badLightingNode;
  self->_badLightingNode = v19;

  v21 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147483635, CFSTR("Junk - Blurry"), 0.22, 0.51, 0.2);
  blurryNode = self->_blurryNode;
  self->_blurryNode = v21;

  v23 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147483636, CFSTR("Junk - Food or Drink"), 0.25, 0.42, 0.12);
  foodOrDrinkNode = self->_foodOrDrinkNode;
  self->_foodOrDrinkNode = v23;

  v25 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147483637, CFSTR("Junk - Other"), 0.0, 0.0, 0.0);
  otherNode = self->_otherNode;
  self->_otherNode = v25;

  v27 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147483638, CFSTR("Junk - Medical Reference"), 0.14, 0.32, 0.08);
  medicalReferenceNode = self->_medicalReferenceNode;
  self->_medicalReferenceNode = v27;

  v29 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147483639, CFSTR("Junk - Negative Internal"), 0.18, 0.31, 0.12);
  negativeInternalNode = self->_negativeInternalNode;
  self->_negativeInternalNode = v29;

  v31 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147483640, CFSTR("Junk - Receipt or Document"), 0.46, 0.67, 0.22);
  receiptOrDocumentNode = self->_receiptOrDocumentNode;
  self->_receiptOrDocumentNode = v31;

  v33 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147483641, CFSTR("Junk - Repair Reference"), 0.12, 0.24, 0.06);
  repairReferenceNode = self->_repairReferenceNode;
  self->_repairReferenceNode = v33;

  v35 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147483642, CFSTR("Junk - Shopping Reference"), 0.26, 0.44, 0.11);
  shoppingReferenceNode = self->_shoppingReferenceNode;
  self->_shoppingReferenceNode = v35;

  v37 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147483643, CFSTR("Junk - Utility Reference"), 0.41, 0.64, 0.21);
  utilityReferenceNode = self->_utilityReferenceNode;
  self->_utilityReferenceNode = v37;

}

- (void)setupVersion86
{
  CLSSignalNode *v3;
  CLSSignalNode *negativeNode;
  CLSSignalNode *v5;
  CLSSignalNode *nonMemorableNode;
  CLSSignalNode *v7;
  CLSSignalNode *poorQualityNode;
  CLSSignalNode *v9;
  CLSSignalNode *textDocumentNode;
  CLSSignalNode *v11;
  CLSSignalNode *tragicFailureNode;
  CLSSignalNode *v13;
  CLSSignalNode *tragicFailureInternalNode;
  CLSSignalNode *v15;
  CLSSignalNode *screenshotNode;
  CLSSignalNode *v17;
  CLSSignalNode *badFramingNode;
  CLSSignalNode *v19;
  CLSSignalNode *badLightingNode;
  CLSSignalNode *v21;
  CLSSignalNode *blurryNode;
  CLSSignalNode *v23;
  CLSSignalNode *foodOrDrinkNode;
  CLSSignalNode *v25;
  CLSSignalNode *otherNode;
  CLSSignalNode *v27;
  CLSSignalNode *medicalReferenceNode;
  CLSSignalNode *v29;
  CLSSignalNode *negativeInternalNode;
  CLSSignalNode *v31;
  CLSSignalNode *receiptOrDocumentNode;
  CLSSignalNode *v33;
  CLSSignalNode *repairReferenceNode;
  CLSSignalNode *v35;
  CLSSignalNode *shoppingReferenceNode;
  CLSSignalNode *v37;
  CLSSignalNode *utilityReferenceNode;

  self->_version = 86;
  v3 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147483644, CFSTR("Junk - Negative"), 0.1, 0.31, 0.06);
  negativeNode = self->_negativeNode;
  self->_negativeNode = v3;

  v5 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147483645, CFSTR("Junk - Non Memorable"), 0.44, 0.55, 0.32);
  nonMemorableNode = self->_nonMemorableNode;
  self->_nonMemorableNode = v5;

  v7 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147483646, CFSTR("Junk - Poor Quality"), 0.54, 0.83, 0.21);
  poorQualityNode = self->_poorQualityNode;
  self->_poorQualityNode = v7;

  v9 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147483629, CFSTR("Junk - Text Document"), 0.58, 0.59, 0.34);
  textDocumentNode = self->_textDocumentNode;
  self->_textDocumentNode = v9;

  v11 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147483631, CFSTR("Junk - Tragic Failure"), 0.15, 0.37, 0.11);
  tragicFailureNode = self->_tragicFailureNode;
  self->_tragicFailureNode = v11;

  v13 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147483630, CFSTR("Junk - Tragic Failure Internal"), 0.0, 0.0, 0.0);
  tragicFailureInternalNode = self->_tragicFailureInternalNode;
  self->_tragicFailureInternalNode = v13;

  v15 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147483632, CFSTR("Junk - Screenshot"), 0.47, 0.58, 0.18);
  screenshotNode = self->_screenshotNode;
  self->_screenshotNode = v15;

  v17 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147483633, CFSTR("Junk - Bad Framing"), 0.0, 0.0, 0.0);
  badFramingNode = self->_badFramingNode;
  self->_badFramingNode = v17;

  v19 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147483634, CFSTR("Junk - Bad Lighting"), 0.0, 0.0, 0.0);
  badLightingNode = self->_badLightingNode;
  self->_badLightingNode = v19;

  v21 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147483635, CFSTR("Junk - Blurry"), 0.0, 0.0, 0.0);
  blurryNode = self->_blurryNode;
  self->_blurryNode = v21;

  v23 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147483636, CFSTR("Junk - Food or Drink"), 0.3, 0.5, 0.15);
  foodOrDrinkNode = self->_foodOrDrinkNode;
  self->_foodOrDrinkNode = v23;

  v25 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147483637, CFSTR("Junk - Other"), 0.0, 0.0, 0.0);
  otherNode = self->_otherNode;
  self->_otherNode = v25;

  v27 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147483638, CFSTR("Junk - Medical Reference"), 0.0, 0.0, 0.0);
  medicalReferenceNode = self->_medicalReferenceNode;
  self->_medicalReferenceNode = v27;

  v29 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147483639, CFSTR("Junk - Negative Internal"), 0.0, 0.0, 0.0);
  negativeInternalNode = self->_negativeInternalNode;
  self->_negativeInternalNode = v29;

  v31 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147483640, CFSTR("Junk - Receipt or Document"), 0.44, 0.58, 0.4);
  receiptOrDocumentNode = self->_receiptOrDocumentNode;
  self->_receiptOrDocumentNode = v31;

  v33 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147483641, CFSTR("Junk - Repair Reference"), 0.0, 0.0, 0.0);
  repairReferenceNode = self->_repairReferenceNode;
  self->_repairReferenceNode = v33;

  v35 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147483642, CFSTR("Junk - Shopping Reference"), 0.0, 0.0, 0.0);
  shoppingReferenceNode = self->_shoppingReferenceNode;
  self->_shoppingReferenceNode = v35;

  v37 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", 2147483643, CFSTR("Junk - Utility Reference"), 0.0, 0.0, 0.0);
  utilityReferenceNode = self->_utilityReferenceNode;
  self->_utilityReferenceNode = v37;

}

- (id)nodeForSignalIdentifier:(unint64_t)a3
{
  CLSSignalNode *textDocumentNode;
  CLSSignalNode *v5;
  void *v7;

  switch((int)a3)
  {
    case 0x7FFFFFED:
      textDocumentNode = self->_textDocumentNode;
      goto LABEL_21;
    case 0x7FFFFFEE:
      textDocumentNode = self->_tragicFailureInternalNode;
      goto LABEL_21;
    case 0x7FFFFFEF:
      textDocumentNode = self->_tragicFailureNode;
      goto LABEL_21;
    case 0x7FFFFFF0:
      textDocumentNode = self->_screenshotNode;
      goto LABEL_21;
    case 0x7FFFFFF1:
      textDocumentNode = self->_badFramingNode;
      goto LABEL_21;
    case 0x7FFFFFF2:
      textDocumentNode = self->_badLightingNode;
      goto LABEL_21;
    case 0x7FFFFFF3:
      textDocumentNode = self->_blurryNode;
      goto LABEL_21;
    case 0x7FFFFFF4:
      textDocumentNode = self->_foodOrDrinkNode;
      goto LABEL_21;
    case 0x7FFFFFF5:
      textDocumentNode = self->_otherNode;
      goto LABEL_21;
    case 0x7FFFFFF6:
      textDocumentNode = self->_medicalReferenceNode;
      goto LABEL_21;
    case 0x7FFFFFF7:
      textDocumentNode = self->_negativeInternalNode;
      goto LABEL_21;
    case 0x7FFFFFF8:
      textDocumentNode = self->_receiptOrDocumentNode;
      goto LABEL_21;
    case 0x7FFFFFF9:
      textDocumentNode = self->_repairReferenceNode;
      goto LABEL_21;
    case 0x7FFFFFFA:
      textDocumentNode = self->_shoppingReferenceNode;
      goto LABEL_21;
    case 0x7FFFFFFB:
      textDocumentNode = self->_utilityReferenceNode;
      goto LABEL_21;
    case 0x7FFFFFFC:
      textDocumentNode = self->_negativeNode;
      goto LABEL_21;
    case 0x7FFFFFFD:
      textDocumentNode = self->_nonMemorableNode;
      goto LABEL_21;
    case 0x7FFFFFFE:
      textDocumentNode = self->_poorQualityNode;
      goto LABEL_21;
    case 0x7FFFFFFF:
      textDocumentNode = self->_legacyNode;
LABEL_21:
      v5 = textDocumentNode;
      break;
    default:
      if (-[CLSJunkClassificationModel isResponsibleForSignalIdentifier:](self, "isResponsibleForSignalIdentifier:", a3))
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Junk - Unknown (%X)"), a3);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = -[CLSSignalNode initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:]([CLSSignalNode alloc], "initWithIdentifier:name:operatingPoint:highPrecisionOperatingPoint:highRecallOperatingPoint:", a3, v7, 0.0, 0.0, 0.0);

      }
      else
      {
        v5 = 0;
      }
      break;
  }
  return v5;
}

- (BOOL)isResponsibleForSignalIdentifier:(unint64_t)a3
{
  return (~(_DWORD)a3 & 0x7FFFFF00) == 0;
}

- (id)modelInfo
{
  id v3;
  id v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  id v6;
  _QWORD v8[4];
  id v9;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __39__CLSJunkClassificationModel_modelInfo__block_invoke;
  v8[3] = &unk_25149B6C8;
  v4 = v3;
  v9 = v4;
  v5 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x2495071CC](v8);
  ((void (**)(_QWORD, CLSSignalNode *, uint64_t))v5)[2](v5, self->_negativeNode, 1);
  ((void (**)(_QWORD, CLSSignalNode *, uint64_t))v5)[2](v5, self->_nonMemorableNode, 1);
  ((void (**)(_QWORD, CLSSignalNode *, uint64_t))v5)[2](v5, self->_poorQualityNode, 1);
  ((void (**)(_QWORD, CLSSignalNode *, uint64_t))v5)[2](v5, self->_textDocumentNode, 1);
  ((void (**)(_QWORD, CLSSignalNode *, uint64_t))v5)[2](v5, self->_tragicFailureNode, 1);
  ((void (**)(_QWORD, CLSSignalNode *, _QWORD))v5)[2](v5, self->_tragicFailureInternalNode, 0);
  ((void (**)(_QWORD, CLSSignalNode *, _QWORD))v5)[2](v5, self->_screenshotNode, 0);
  ((void (**)(_QWORD, CLSSignalNode *, _QWORD))v5)[2](v5, self->_badFramingNode, 0);
  ((void (**)(_QWORD, CLSSignalNode *, _QWORD))v5)[2](v5, self->_badLightingNode, 0);
  ((void (**)(_QWORD, CLSSignalNode *, _QWORD))v5)[2](v5, self->_blurryNode, 0);
  ((void (**)(_QWORD, CLSSignalNode *, _QWORD))v5)[2](v5, self->_foodOrDrinkNode, 0);
  ((void (**)(_QWORD, CLSSignalNode *, _QWORD))v5)[2](v5, self->_otherNode, 0);
  ((void (**)(_QWORD, CLSSignalNode *, _QWORD))v5)[2](v5, self->_medicalReferenceNode, 0);
  ((void (**)(_QWORD, CLSSignalNode *, _QWORD))v5)[2](v5, self->_negativeInternalNode, 0);
  ((void (**)(_QWORD, CLSSignalNode *, _QWORD))v5)[2](v5, self->_receiptOrDocumentNode, 0);
  ((void (**)(_QWORD, CLSSignalNode *, _QWORD))v5)[2](v5, self->_repairReferenceNode, 0);
  ((void (**)(_QWORD, CLSSignalNode *, _QWORD))v5)[2](v5, self->_shoppingReferenceNode, 0);
  ((void (**)(_QWORD, CLSSignalNode *, _QWORD))v5)[2](v5, self->_utilityReferenceNode, 0);
  v6 = v4;

  return v6;
}

- (unint64_t)version
{
  return self->_version;
}

- (CLSSignalNode)negativeNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 16, 1);
}

- (CLSSignalNode)nonMemorableNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 24, 1);
}

- (CLSSignalNode)poorQualityNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 32, 1);
}

- (CLSSignalNode)textDocumentNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 40, 1);
}

- (CLSSignalNode)tragicFailureNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 48, 1);
}

- (CLSSignalNode)tragicFailureInternalNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 56, 1);
}

- (CLSSignalNode)screenshotNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 64, 1);
}

- (CLSSignalNode)badFramingNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 72, 1);
}

- (CLSSignalNode)badLightingNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 80, 1);
}

- (CLSSignalNode)blurryNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 88, 1);
}

- (CLSSignalNode)foodOrDrinkNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 96, 1);
}

- (CLSSignalNode)otherNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 104, 1);
}

- (CLSSignalNode)medicalReferenceNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 112, 1);
}

- (CLSSignalNode)negativeInternalNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 120, 1);
}

- (CLSSignalNode)receiptOrDocumentNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 128, 1);
}

- (CLSSignalNode)repairReferenceNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 136, 1);
}

- (CLSSignalNode)shoppingReferenceNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 144, 1);
}

- (CLSSignalNode)utilityReferenceNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 152, 1);
}

- (CLSSignalNode)legacyNode
{
  return (CLSSignalNode *)objc_getProperty(self, a2, 160, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_legacyNode, 0);
  objc_storeStrong((id *)&self->_utilityReferenceNode, 0);
  objc_storeStrong((id *)&self->_shoppingReferenceNode, 0);
  objc_storeStrong((id *)&self->_repairReferenceNode, 0);
  objc_storeStrong((id *)&self->_receiptOrDocumentNode, 0);
  objc_storeStrong((id *)&self->_negativeInternalNode, 0);
  objc_storeStrong((id *)&self->_medicalReferenceNode, 0);
  objc_storeStrong((id *)&self->_otherNode, 0);
  objc_storeStrong((id *)&self->_foodOrDrinkNode, 0);
  objc_storeStrong((id *)&self->_blurryNode, 0);
  objc_storeStrong((id *)&self->_badLightingNode, 0);
  objc_storeStrong((id *)&self->_badFramingNode, 0);
  objc_storeStrong((id *)&self->_screenshotNode, 0);
  objc_storeStrong((id *)&self->_tragicFailureInternalNode, 0);
  objc_storeStrong((id *)&self->_tragicFailureNode, 0);
  objc_storeStrong((id *)&self->_textDocumentNode, 0);
  objc_storeStrong((id *)&self->_poorQualityNode, 0);
  objc_storeStrong((id *)&self->_nonMemorableNode, 0);
  objc_storeStrong((id *)&self->_negativeNode, 0);
}

void __39__CLSJunkClassificationModel_modelInfo__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "signalInfoWithIsHierarchical:");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

+ (unint64_t)baseSceneAnalysisVersionWithSceneAnalysisVersion:(unint64_t)a3
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 81;
  v4 = 40;
  v5 = 32;
  if (a3 == 31)
    v6 = 31;
  else
    v6 = 0;
  if (a3 <= 0x1F)
    v5 = v6;
  if (a3 <= 0x27)
    v4 = v5;
  if (a3 <= 0x50)
    v3 = v4;
  if (a3 <= 0x55)
    return v3;
  else
    return 86;
}

+ (NSString)name
{
  return (NSString *)CFSTR("Junk Classification");
}

+ (unint64_t)latestVersion
{
  return 86;
}

@end
