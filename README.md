# ملفات تشغيل Microsoft Visual C++

يتضمن المستودع 12 ملف DLL: خمسة ملفات x86 في `SysWOW64` وسبعة ملفات x64 في `System32`. أسماء المجلدات تطابق ترتيب Windows ذي 64 بت.

| الملفات | الوظيفة |
| --- | --- |
| `msvcp140.dll` | مكتبة C++ القياسية من Microsoft |
| `vcruntime140.dll` | دعم تشغيل البرامج المبنية باستخدام Visual C++ |
| `vcruntime140_1.dll` | دعم إضافي لتشغيل C++ في بنية x64، ومنه معالجة الاستثناءات |
| `msvcp140d.dll`, `vcruntime140d.dll`, `vcruntime140_1d.dll` | نسخ Debug للتطوير والاختبار؛ ليست بدائل للملفات التي لا تنتهي بحرف d |
| `ucrtbased.dll` | نسخة Debug من Universal C Runtime |

نُزّلت الملفات الموجودة سابقًا في سكربت المستخدم من روابطها الأصلية في `ramziyehyayehya779/dll`. نُسخ الملف الإضافي `System32/vcruntime140_1.dll` من الجهاز المحلي، بإصدار `14.50.35719.0`. تم التحقق من توقيع Microsoft ومعمارية كل ملف. يسجل `runtime-manifest.json` الإصدارات وبصمات SHA-256 ومصادر التنزيل.

رسالة الخطأ المرفقة تطلب `VCRUNTIME140_1.dll`، بينما السكربت القديم يتضمن `vcruntime140_1d.dll` فقط. أُضيف الملف الأول دون إعادة تسمية الثاني. فُحصت نسخة التطبيق التي ينزّلها السكربت من `ftpv/ldb/main/drivere.exe`، وهي x64 وتستورد `VCRUNTIME140_1.dll` مباشرة، إلى جانب `MSVCP140.dll` و`VCRUNTIME140.dll`. تمت مطابقة الملف المنزّل مع بصمة GitHub، ويسجل `application-dependencies.json` نتيجة الفحص. هذا فحص ساكن دون تشغيل التطبيق؛ لم تُختبر النتيجة على الجهاز الذي ظهرت فيه الرسالة.

`install.bat` في هذا المستودع يقتصر على تنزيل ملفات التشغيل، ويكتب إلى مجلدات Windows عند تشغيله بصلاحيات المسؤول. يتوقف عند فشل أي تنزيل. لم يُشغّل أثناء تجهيز المستودع. لم تُرفع بقية أوامر سكربت التطبيق أو ملفاته.

| السكربت | المكتبات والوجهة |
| --- | --- |
| `install32.bat` | ملفات x86 الخمسة؛ إلى `SysWOW64` على Windows ذي 64 بت، أو `System32` على Windows ذي 32 بت |
| `install64.bat` | ملفات x64 السبعة؛ إلى `System32` باستخدام PowerShell ذي 64 بت، ويتضمن `vcruntime140_1.dll` |
| `install.bat` | المجموعة المجمعة للمعماريتين على Windows ذي 64 بت |

يمكن تشغيل `install32.bat --list` أو `install64.bat --list` لعرض المعمارية والوجهة دون تنزيل أو تثبيت. تم اختبار المعاينة من سطر أوامر Windows ذي 64 بت، واختبار معاينة ملف x64 أيضًا من سطر أوامر ذي 32 بت على الجهاز نفسه. لم يُجر اختبار على نظام Windows ذي 32 بت. سكربتات المكتبات لا تحوّل التطبيق إلى x86؛ نسخة `drivere.exe` في الرابط الحالي تبقى x64.

توصي Microsoft بحزمة Visual C++ Redistributable الرسمية لمكتبات Release، وتوضح أن مكتبات Debug مخصصة للتطوير والاختبار ولها قيود على إعادة التوزيع:

- [تنزيل حزم Microsoft الرسمية](https://learn.microsoft.com/en-us/cpp/windows/latest-supported-vc-redist)
- [مكتبات Debug واستخدامها على أجهزة الاختبار](https://learn.microsoft.com/en-us/cpp/windows/preparing-a-test-machine-to-run-a-debug-executable)
