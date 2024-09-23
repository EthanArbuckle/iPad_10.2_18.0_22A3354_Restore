@implementation TCVegaRenderer

- (TCVegaRenderer)init
{
  return -[TCVegaRenderer initWithSpec:config:scaleFactor:](self, "initWithSpec:config:scaleFactor:", 0, 0, 1.0);
}

- (TCVegaRenderer)initWithSpec:(id)a3
{
  return -[TCVegaRenderer initWithSpec:config:scaleFactor:](self, "initWithSpec:config:scaleFactor:", a3, 0, 2.0);
}

- (TCVegaRenderer)initWithSpec:(id)a3 config:(id)a4 scaleFactor:(double)a5
{
  id v8;
  __CFString *v9;
  TCVegaRenderer *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  TCVegaCGCanvas *v23;
  TCVegaJSDocument *v24;
  void *v25;
  TCVegaJSDocument *v26;
  void *v27;
  TCVegaHTMLElement *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  __CFString *v45;
  __CFString *v46;
  void *v47;
  void *v48;
  id v49;
  objc_super v51;
  _QWORD v52[3];

  v52[2] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = (__CFString *)a4;
  v51.receiver = self;
  v51.super_class = (Class)TCVegaRenderer;
  v10 = -[TCVegaRenderer init](&v51, sel_init);
  -[TCVegaRenderer setSpec:](v10, "setSpec:", v8);
  -[TCVegaRenderer setScaleFactor:](v10, "setScaleFactor:", a5);
  v11 = objc_alloc_init(MEMORY[0x24BDDA720]);
  -[TCVegaRenderer setContext:](v10, "setContext:", v11);

  v12 = (void *)MEMORY[0x219A19FE4]();
  -[TCVegaRenderer context](v10, "context");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "globalObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[TCVegaRenderer context](v10, "context");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v14, CFSTR("window"));

  v16 = (void *)MEMORY[0x24BDD16E0];
  -[TCVegaRenderer scaleFactor](v10, "scaleFactor");
  objc_msgSend(v16, "numberWithDouble:");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[TCVegaRenderer context](v10, "context");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("window"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v17, CFSTR("devicePixelRatio"));

  v20 = objc_opt_class();
  -[TCVegaRenderer context](v10, "context");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setObject:forKeyedSubscript:", v20, CFSTR("HTMLElement"));

  -[TCVegaRenderer context](v10, "context");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[TCVegaJSConsole attachToJavaScriptContext:](TCVegaJSConsole, "attachToJavaScriptContext:", v22);

  v23 = objc_alloc_init(TCVegaCGCanvas);
  -[TCVegaRenderer setVegaCanvas:](v10, "setVegaCanvas:", v23);

  v24 = [TCVegaJSDocument alloc];
  -[TCVegaRenderer vegaCanvas](v10, "vegaCanvas");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = -[TCVegaJSDocument initWithCanvas:](v24, "initWithCanvas:", v25);

  -[TCVegaRenderer setVegaJSDocument:](v10, "setVegaJSDocument:", v26);
  -[TCVegaRenderer context](v10, "context");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setObject:forKeyedSubscript:", v26, CFSTR("document"));

  v28 = -[TCVegaHTMLElement initWithTagName:]([TCVegaHTMLElement alloc], "initWithTagName:", CFSTR("div"));
  -[TCVegaRenderer context](v10, "context");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setObject:forKeyedSubscript:", v28, CFSTR("container"));

  v30 = (void *)MEMORY[0x24BDDA730];
  -[TCVegaRenderer context](v10, "context");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "valueWithObject:inContext:", &__block_literal_global_1, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[TCVegaRenderer context](v10, "context");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setObject:forKeyedSubscript:", v32, CFSTR("Image"));

  -[TCVegaRenderer context](v10, "context");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  +[TCVegaRenderer vegaJS](TCVegaRenderer, "vegaJS");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (id)objc_msgSend(v34, "evaluateScript:", v35);

  -[TCVegaRenderer context](v10, "context");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  +[TCVegaRenderer vegaliteJS](TCVegaRenderer, "vegaliteJS");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = (id)objc_msgSend(v37, "evaluateScript:", v38);

  -[TCVegaRenderer context](v10, "context");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  +[TCVegaRenderer vg2canvasJS](TCVegaRenderer, "vg2canvasJS");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = (id)objc_msgSend(v40, "evaluateScript:", v41);

  -[TCVegaRenderer context](v10, "context");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("viewRender"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10->spec)
  {
    v45 = &stru_24D951458;
    if (v9)
      v45 = v9;
    v46 = v45;

    -[TCVegaRenderer spec](v10, "spec");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v52[0] = v47;
    v52[1] = v46;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v52, 2);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = (id)objc_msgSend(v44, "callWithArguments:", v48);

    v9 = v46;
  }

  objc_autoreleasePoolPop(v12);
  return v10;
}

TCVegaCGImage *__50__TCVegaRenderer_initWithSpec_config_scaleFactor___block_invoke()
{
  return objc_alloc_init(TCVegaCGImage);
}

- (id)vegaContext
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;

  -[TCVegaRenderer vegaCanvas](self, "vegaCanvas");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x24BDDA730];
    -[TCVegaRenderer vegaCanvas](self, "vegaCanvas");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[TCVegaRenderer context](self, "context");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "valueWithObject:inContext:", v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "toDictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "count"))
    {
      +[TCVegaLogger instance](TCVegaLogger, "instance");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[TCVegaRenderer vegaContext].cold.2(v8);

    }
    objc_msgSend(v7, "invokeMethod:withArguments:", CFSTR("getContext"), &unk_24D95F9C8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "toDictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "count"))
    {
      +[TCVegaLogger instance](TCVegaLogger, "instance");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[TCVegaRenderer vegaContext].cold.1(v11);

    }
    -[TCVegaRenderer vegaCanvas](self, "vegaCanvas");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "getContext:", CFSTR("2d"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }
  return v14;
}

- (unint64_t)width
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  unint64_t v8;

  -[TCVegaRenderer vegaCanvas](self, "vegaCanvas");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "width");
  v6 = v5;
  -[TCVegaRenderer scaleFactor](self, "scaleFactor");
  v8 = (unint64_t)(v6 / v7);

  return v8;
}

- (unint64_t)height
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  unint64_t v8;

  -[TCVegaRenderer vegaCanvas](self, "vegaCanvas");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "height");
  v6 = v5;
  -[TCVegaRenderer scaleFactor](self, "scaleFactor");
  v8 = (unint64_t)(v6 / v7);

  return v8;
}

- (id)cursor
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[TCVegaRenderer vegaJSDocument](self, "vegaJSDocument");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "body");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "style");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cursor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (CGImage)CGImage
{
  void *v2;
  CGImage *Image;

  -[TCVegaRenderer vegaContext](self, "vegaContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  Image = CGBitmapContextCreateImage((CGContextRef)objc_msgSend(v2, "context"));

  return Image;
}

- (void)triggerEventWithType:(id)a3 event:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[TCVegaRenderer vegaCanvas](self, "vegaCanvas");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "events");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[TCVegaRenderer vegaCanvas](self, "vegaCanvas");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "events");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "value");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v17[0] = v7;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (id)objc_msgSend(v14, "callWithArguments:", v15);

  }
}

+ (id)vg2canvasJS
{
  return CFSTR("function viewRender(spec, config) {  config = config || {};  if (typeof config === 'string') {    config = JSON.parse(config);  }  if (typeof spec === 'string') {    spec = JSON.parse(spec);  }  const vlPrefix = 'https://vega.github.io/schema/vega-lite/';  const mode = spec['$schema'].startsWith(vlPrefix) ? 'vega-lite' : 'vega';  if (mode === 'vega-lite') {    spec = vl.compile(spec, { config: config }).spec;  }  const runtime = vega.parse(spec, mode === 'vega-lite' ? {} : config);  window.vegaView = new vega.View(runtime, {    logLevel: vega.Warn,    renderer: 'canvas',    hover: true  })  .initialize(container)  .runAsync()  .catch(err => { console.error(err); });}");
}

+ (id)vegaJS
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &vega_5_4_0_min_js, vega_5_4_0_min_js_len);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v2, 4);

  return v3;
}

+ (id)vegaliteJS
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &vega_lite_3_3_0_min_js, vega_lite_3_3_0_min_js_len);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v2, 4);

  return v3;
}

- (JSContext)context
{
  return (JSContext *)objc_getProperty(self, a2, 8, 1);
}

- (void)setContext:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSString)spec
{
  return self->spec;
}

- (void)setSpec:(id)a3
{
  objc_storeStrong((id *)&self->spec, a3);
}

- (TCVegaCGCanvas)vegaCanvas
{
  return self->vegaCanvas;
}

- (void)setVegaCanvas:(id)a3
{
  objc_storeStrong((id *)&self->vegaCanvas, a3);
}

- (TCVegaJSDocument)vegaJSDocument
{
  return self->vegaJSDocument;
}

- (void)setVegaJSDocument:(id)a3
{
  objc_storeStrong((id *)&self->vegaJSDocument, a3);
}

- (double)scaleFactor
{
  return self->scaleFactor;
}

- (void)setScaleFactor:(double)a3
{
  self->scaleFactor = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->vegaJSDocument, 0);
  objc_storeStrong((id *)&self->vegaCanvas, 0);
  objc_storeStrong((id *)&self->spec, 0);
  objc_storeStrong((id *)&self->context, 0);
}

- (void)vegaContext
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "debugDescription");
  v1 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v1, "UTF8String");
  OUTLINED_FUNCTION_0_1(&dword_217E69000, v2, v3, "Encountered extra properties on canvas: %s", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1_0();
}

@end
