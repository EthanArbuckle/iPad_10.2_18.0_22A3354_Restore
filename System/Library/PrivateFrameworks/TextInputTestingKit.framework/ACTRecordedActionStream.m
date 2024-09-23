@implementation ACTRecordedActionStream

- (ACTRecordedActionStream)initWithParameters:(id)a3 delegate:(id)a4
{
  id v6;
  ACTUserActionStreamDelegate *v7;
  ACTRecordedActionStream *v8;
  ACTUserMentalCursor *v9;
  ACTUserMentalCursor *cursor;
  NSArray *touchEventsForInputSegments;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  ACTUserActionStreaming *dataSynthesizer;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  objc_super v27;
  _QWORD v28[2];
  _QWORD v29[3];

  v29[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (ACTUserActionStreamDelegate *)a4;
  v27.receiver = self;
  v27.super_class = (Class)ACTRecordedActionStream;
  v8 = -[ACTRecordedActionStream init](&v27, sel_init);
  if (v8)
  {
    v9 = objc_alloc_init(ACTUserMentalCursor);
    cursor = v8->_cursor;
    v8->_cursor = v9;

    touchEventsForInputSegments = v8->_touchEventsForInputSegments;
    v8->_touchEventsForInputSegments = (NSArray *)MEMORY[0x24BDBD1A8];

    v12 = MEMORY[0x24BDBD1C0];
    v8->_delegate = v7;
    v28[0] = CFSTR("BASE_KEY_FOR_VARIANTS");
    v28[1] = CFSTR("DECOMPOSE_INPUT_STRING");
    v29[0] = v12;
    objc_msgSend(v6, "objectForKeyedSubscript:");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    if (v13)
      v15 = v13;
    else
      v15 = v12;
    v29[1] = v15;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v29, v28, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    +[ACTUserActionStreamFactory userActionStreamWithParameters:delegate:](ACTUserActionStreamFactory, "userActionStreamWithParameters:delegate:", v16, v8->_delegate);
    v17 = objc_claimAutoreleasedReturnValue();
    dataSynthesizer = v8->_dataSynthesizer;
    v8->_dataSynthesizer = (ACTUserActionStreaming *)v17;

  }
  -[ACTRecordedActionStream configureWithParameters:](v8, "configureWithParameters:", v6);
  -[ACTRecordedActionStream touchEventsForInputSegments](v8, "touchEventsForInputSegments");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACTRecordedActionStream cursor](v8, "cursor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectAtIndex:", objc_msgSend(v20, "segmentCursor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "count");

  if (!v22)
  {
    -[ACTRecordedActionStream cursor](v8, "cursor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "currentInternalSegment");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACTRecordedActionStream dataSynthesizer](v8, "dataSynthesizer");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setIntendedText:", v24);

  }
  return v8;
}

- (void)configureWithParameters:(id)a3
{
  void *v3;
  unint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  unint64_t v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  ACTUserMentalCursor *v33;
  void *v34;
  void *v35;
  ACTUserMentalCursor *v36;
  void *v37;
  void *v39;
  id obj;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "objectForKey:", CFSTR("TTKTestCase"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v39 = v3;
  objc_msgSend(v3, "records");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
  if (v44)
  {
    v4 = 0;
    v43 = *(_QWORD *)v55;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v55 != v43)
          objc_enumerationMutation(obj);
        v46 = v5;
        v6 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * v5);
        objc_msgSend(MEMORY[0x24BDBCEB8], "array");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = 0u;
        v51 = 0u;
        v52 = 0u;
        v53 = 0u;
        v45 = v6;
        objc_msgSend(v6, "touchDataCollection");
        v47 = (id)objc_claimAutoreleasedReturnValue();
        v49 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
        if (v49)
        {
          v48 = *(_QWORD *)v51;
          do
          {
            for (i = 0; i != v49; ++i)
            {
              if (*(_QWORD *)v51 != v48)
                objc_enumerationMutation(v47);
              v9 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
              objc_msgSend(v9, "samples");
              v10 = (void *)objc_claimAutoreleasedReturnValue();
              v11 = objc_msgSend(v10, "count");

              if (v11)
              {
                v12 = 0;
                do
                {
                  objc_msgSend(v9, "samples");
                  v13 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v13, "objectAtIndex:", v12);
                  v14 = (void *)objc_claimAutoreleasedReturnValue();

                  if (objc_msgSend(v14, "stage") == 7)
                  {
                    if (v12)
                    {
                      objc_msgSend(v9, "samples");
                      v15 = (void *)objc_claimAutoreleasedReturnValue();
                      if (v12 + 1 == objc_msgSend(v15, "count"))
                        v16 = 2;
                      else
                        v16 = 1;

                    }
                    else
                    {
                      v16 = 0;
                    }
                  }
                  else
                  {
                    v16 = objc_msgSend(v14, "stage");
                  }
                  if ((objc_msgSend(v14, "pathIndex") & 0x8000000000000000) == 0)
                    v4 = objc_msgSend(v14, "pathIndex");
                  v17 = (void *)MEMORY[0x24BEB4E68];
                  objc_msgSend(v14, "point");
                  v19 = v18;
                  v21 = v20;
                  objc_msgSend(v14, "radius");
                  v23 = v22;
                  objc_msgSend(v14, "timeStamp");
                  objc_msgSend(v17, "touchEventWithStage:location:radius:timestamp:pathIndex:forcedKeyCode:", v16, v4, -1, v19, v21, v23, v24);
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v7, "addObject:", v25);

                  ++v12;
                  objc_msgSend(v9, "samples");
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  v27 = objc_msgSend(v26, "count");

                }
                while (v12 < v27);
              }
              v4 = (v4 + 1) % 0xC;
            }
            v49 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
          }
          while (v49);
        }

        objc_msgSend(v7, "sortUsingComparator:", &__block_literal_global_4966);
        if ((unint64_t)objc_msgSend(v7, "count") < 2)
        {
LABEL_30:
          objc_msgSend(v45, "primaryIntendedText");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "addObject:", v31);

          v32 = (void *)objc_msgSend(v7, "copy");
          objc_msgSend(v41, "addObject:", v32);

          goto LABEL_32;
        }
        objc_msgSend(v7, "firstObject");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v28, "stage"))
        {

        }
        else
        {
          objc_msgSend(v7, "lastObject");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = objc_msgSend(v29, "stage");

          if (v30 == 2)
            goto LABEL_30;
        }
        NSLog(&CFSTR("Warning: After timestamp sorting, first sample is not a TIKeyboardTouchStageDown, and/or last sample is n"
                     "ot a TIKeyboardTouchStageUp-- is it possible that your timestamps are out of order?").isa);
LABEL_32:

        v5 = v46 + 1;
      }
      while (v46 + 1 != v44);
      v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
    }
    while (v44);
  }

  v33 = [ACTUserMentalCursor alloc];
  v34 = (void *)objc_msgSend(v42, "copy");
  v35 = (void *)objc_msgSend(v42, "copy");
  v36 = -[ACTUserMentalCursor initWithInternalSegments:externalSegments:](v33, "initWithInternalSegments:externalSegments:", v34, v35);
  -[ACTRecordedActionStream setCursor:](self, "setCursor:", v36);

  v37 = (void *)objc_msgSend(v41, "copy");
  -[ACTRecordedActionStream setTouchEventsForInputSegments:](self, "setTouchEventsForInputSegments:", v37);

  -[ACTRecordedActionStream setTouchEventCursor:](self, "setTouchEventCursor:", 0);
}

- (NSString)intendedText
{
  void *v2;
  void *v3;

  -[ACTRecordedActionStream cursor](self, "cursor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "intendedText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)nextUserAction
{
  ACTTouchEvent *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (-[ACTRecordedActionStream isFinished](self, "isFinished"))
  {
    v3 = 0;
  }
  else
  {
    -[ACTRecordedActionStream touchEventsForInputSegments](self, "touchEventsForInputSegments");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACTRecordedActionStream cursor](self, "cursor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectAtIndex:", objc_msgSend(v5, "segmentCursor"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v6, "count"))
    {
      objc_msgSend(v6, "objectAtIndex:", -[ACTRecordedActionStream touchEventCursor](self, "touchEventCursor"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = -[ACTTouchEvent initWithTouchEvent:]([ACTTouchEvent alloc], "initWithTouchEvent:", v7);
      -[ACTRecordedActionStream cursor](self, "cursor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[ACTUserAction setInputSegment:](v3, "setInputSegment:", objc_msgSend(v8, "segmentCursor"));

    }
    else
    {
      -[ACTRecordedActionStream dataSynthesizer](self, "dataSynthesizer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "nextUserAction");
      v3 = (ACTTouchEvent *)objc_claimAutoreleasedReturnValue();
    }

    -[ACTRecordedActionStream stepCursor](self, "stepCursor");
  }
  return v3;
}

- (void)stepCursor
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;

  -[ACTRecordedActionStream touchEventsForInputSegments](self, "touchEventsForInputSegments");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACTRecordedActionStream cursor](self, "cursor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndex:", objc_msgSend(v4, "segmentCursor"));
  v17 = (id)objc_claimAutoreleasedReturnValue();

  -[ACTRecordedActionStream setTouchEventCursor:](self, "setTouchEventCursor:", -[ACTRecordedActionStream touchEventCursor](self, "touchEventCursor") + 1);
  if (objc_msgSend(v17, "count"))
  {
    v5 = -[ACTRecordedActionStream touchEventCursor](self, "touchEventCursor");
    if (v5 >= objc_msgSend(v17, "count"))
      goto LABEL_5;
  }
  -[ACTRecordedActionStream dataSynthesizer](self, "dataSynthesizer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "intendedText");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "length"))
    goto LABEL_9;
  -[ACTRecordedActionStream dataSynthesizer](self, "dataSynthesizer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isFinished");

  if (v9)
  {
LABEL_5:
    -[ACTRecordedActionStream cursor](self, "cursor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "advanceSegmentCursor");

    if (v11)
    {
      -[ACTRecordedActionStream setTouchEventCursor:](self, "setTouchEventCursor:", 0);
      -[ACTRecordedActionStream touchEventsForInputSegments](self, "touchEventsForInputSegments");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[ACTRecordedActionStream cursor](self, "cursor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectAtIndex:", objc_msgSend(v13, "segmentCursor"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "count");

      if (v15)
      {
        -[ACTRecordedActionStream dataSynthesizer](self, "dataSynthesizer");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setIntendedText:", &stru_24FD49B78);
LABEL_10:

        goto LABEL_11;
      }
      -[ACTRecordedActionStream cursor](self, "cursor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "currentInternalSegment");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[ACTRecordedActionStream dataSynthesizer](self, "dataSynthesizer");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setIntendedText:", v7);

LABEL_9:
      goto LABEL_10;
    }
  }
LABEL_11:

}

- (BOOL)inPartialCandidateSelection
{
  return 0;
}

- (BOOL)isFinished
{
  void *v3;
  void *v4;
  char v5;

  -[ACTRecordedActionStream cursor](self, "cursor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "atEndOfText"))
  {
    -[ACTRecordedActionStream dataSynthesizer](self, "dataSynthesizer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isFinished");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (ACTUserActionStreamDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (ACTUserActionStreamDelegate *)a3;
}

- (TIErrorGenerator)errorGenerator
{
  return self->_errorGenerator;
}

- (void)setErrorGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_errorGenerator, a3);
}

- (TIKeyboardTyperUserModel)userModel
{
  return self->_userModel;
}

- (void)setUserModel:(id)a3
{
  objc_storeStrong((id *)&self->_userModel, a3);
}

- (unsigned)randomNumberSeed
{
  return self->_randomNumberSeed;
}

- (void)setRandomNumberSeed:(unsigned int)a3
{
  self->_randomNumberSeed = a3;
}

- (ACTUserMentalCursor)cursor
{
  return self->_cursor;
}

- (void)setCursor:(id)a3
{
  objc_storeStrong((id *)&self->_cursor, a3);
}

- (double)lastTimestamp
{
  return self->_lastTimestamp;
}

- (void)setLastTimestamp:(double)a3
{
  self->_lastTimestamp = a3;
}

- (TTKTestCase)testCase
{
  return self->_testCase;
}

- (void)setTestCase:(id)a3
{
  objc_storeStrong((id *)&self->_testCase, a3);
}

- (NSArray)touchEventsForInputSegments
{
  return self->_touchEventsForInputSegments;
}

- (void)setTouchEventsForInputSegments:(id)a3
{
  objc_storeStrong((id *)&self->_touchEventsForInputSegments, a3);
}

- (unint64_t)touchEventCursor
{
  return self->_touchEventCursor;
}

- (void)setTouchEventCursor:(unint64_t)a3
{
  self->_touchEventCursor = a3;
}

- (ACTUserActionStreaming)dataSynthesizer
{
  return (ACTUserActionStreaming *)objc_getProperty(self, a2, 80, 1);
}

- (void)setDataSynthesizer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSynthesizer, 0);
  objc_storeStrong((id *)&self->_touchEventsForInputSegments, 0);
  objc_storeStrong((id *)&self->_testCase, 0);
  objc_storeStrong((id *)&self->_cursor, 0);
  objc_storeStrong((id *)&self->_userModel, 0);
  objc_storeStrong((id *)&self->_errorGenerator, 0);
}

uint64_t __51__ACTRecordedActionStream_configureWithParameters___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "timestamp");
  v7 = v6;
  objc_msgSend(v5, "timestamp");
  if (v7 >= v8)
  {
    objc_msgSend(v4, "timestamp");
    v11 = v10;
    objc_msgSend(v5, "timestamp");
    v9 = v11 != v12;
  }
  else
  {
    v9 = -1;
  }

  return v9;
}

+ (id)userActionStreamWithParameters:(id)a3 delegate:(id)a4
{
  id v5;
  id v6;
  ACTRecordedActionStream *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[ACTRecordedActionStream initWithParameters:delegate:]([ACTRecordedActionStream alloc], "initWithParameters:delegate:", v6, v5);

  return v7;
}

@end
