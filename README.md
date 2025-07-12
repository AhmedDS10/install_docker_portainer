
---

````markdown
# 🐳 install_docker_portainer

برنامج سكريبت بسيط لتثبيت Docker و Portainer على أنظمة Linux (Debian / Ubuntu / Kali / Raspberry Pi OS).

## 📌 المتطلبات

- نظام تشغيل يدعم apt (مثل: Debian, Ubuntu, Kali Linux, Raspberry Pi OS).
- صلاحيات root أو sudo.
- اتصال بالإنترنت.

## 🚀 ما يقوم به السكريبت

1. تثبيت Docker.
2. تشغيل خدمة Docker تلقائيًا.
3. سحب صورة Portainer.
4. تشغيل حاوية Portainer على المنفذ `9000`.
5. توفير واجهة ويب لإدارة الحاويات (Docker containers) من خلال المتصفح.

## 🛠️ طريقة الاستخدام

1. قم باستنساخ المستودع:
   ```bash
   git clone https://github.com/AhmedDS10/install_docker_portainer.git
   cd install_docker_portainer
````

2. اجعل السكريبت قابلاً للتنفيذ:

   ```bash
   chmod +x install.sh
   ```

3. شغّل السكريبت:

   ```bash
   ./install.sh
   ```

4. بعد الانتهاء، افتح متصفح الإنترنت وتوجه إلى:

   ```
   http://<عنوان-الـIP-الخاص-بك>:9000
   ```


## ❗ ملاحظات

* تأكد من فتح المنفذ `9000` في الجدار الناري إذا كنت تستخدم خادم بعيد (VPS).
* السكريبت يعمل على معظم توزيعات Linux التي تستخدم `apt`، لكن يُفضل تجربته على الأنظمة المحدثة فقط.

## 📄 الترخيص

MIT License © [AhmedDS10](https://github.com/AhmedDS10)

```

---

MIT License

Copyright (c) 2025 AhmedDS10

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```
