<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>孔子课题组（日语研究生版）</title>
    <!-- 字体引入 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Serif+SC:wght@400;700;900&family=Noto+Sans+SC:wght@300;400;500;700;900&family=Ma+Shan+Zheng&display=swap" rel="stylesheet">
    <style>
        /* ===== CSS 变量 ===== */
        :root {
            --ink-black: #1a1a2e;
            --ink-dark: #16213e;
            --jade-dark: #0f3460;
            --jade-light: #53a8b6;
            --gold: #d4a373;
            --gold-light: #f0d9b5;
            --parchment: #f5edd6;
            --parchment-dark: #e8dcc8;
            --sakura: #f7c5c5;
            --sakura-light: #fce4e4;
            --red-seal: #c0392b;
            --washi: #faf6ed;
            --text-main: #2c2c2c;
            --text-light: #5a5a5a;
            --shadow: rgba(0, 0, 0, 0.1);
        }

        /* ===== Reset & Base ===== */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Noto Sans SC', sans-serif;
            background: var(--washi);
            color: var(--text-main);
            overflow-x: hidden;
            line-height: 1.8;
        }

        /* ===== 滚动条 ===== */
        ::-webkit-scrollbar {
            width: 8px;
        }
        ::-webkit-scrollbar-track {
            background: var(--parchment);
        }
        ::-webkit-scrollbar-thumb {
            background: var(--gold);
            border-radius: 4px;
        }

        /* ===== 粒子背景 ===== */
        #particles-canvas {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: 0;
            pointer-events: none;
        }

        /* ===== 和纸纹理覆盖 ===== */
        body::before {
            content: '';
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-image: 
                url("data:image/svg+xml,%3Csvg width='60' height='60' viewBox='0 0 60 60' xmlns='http://www.w3.org/2000/svg'%3E%3Cg fill='none' fill-rule='evenodd'%3E%3Cg fill='%23d4a373' fill-opacity='0.03'%3E%3Cpath d='M36 34v-4h-2v4h-4v2h4v4h2v-4h4v-2h-4zm0-30V0h-2v4h-4v2h4v4h2V6h4V4h-4zM6 34v-4H4v4H0v2h4v4h2v-4h4v-2H6zM6 4V0H4v4H0v2h4v4h2V6h4V4H6z'/%3E%3C/g%3E%3C/g%3E%3C/svg%3E");
            pointer-events: none;
            z-index: 0;
        }

        /* ===== 页面容器 ===== */
        .container {
            position: relative;
            z-index: 1;
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
        }

        /* ===== 装饰性边框 ===== */
        .deco-border {
            position: relative;
        }
        .deco-border::before,
        .deco-border::after {
            content: '◆';
            color: var(--gold);
            font-size: 14px;
            position: absolute;
        }

        /* ===== Hero Section ===== */
        .hero {
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
            padding: 80px 20px 60px;
            position: relative;
        }

        .hero-badge {
            display: inline-block;
            background: var(--gold);
            color: white;
            padding: 6px 24px;
            border-radius: 30px;
            font-size: 14px;
            letter-spacing: 3px;
            font-weight: 500;
            margin-bottom: 30px;
            animation: fadeInDown 1s ease;
            box-shadow: 0 4px 15px rgba(212, 163, 115, 0.3);
        }

        .hero-title {
            font-family: 'Noto Serif SC', serif;
            font-size: clamp(2.5rem, 8vw, 5.5rem);
            font-weight: 900;
            color: var(--ink-black);
            line-height: 1.2;
            margin-bottom: 20px;
            animation: fadeInUp 1s ease 0.2s both;
            text-shadow: 2px 2px 0 var(--gold-light);
        }

        .hero-title .highlight {
            background: linear-gradient(135deg, var(--jade-dark), var(--jade-light));
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        .hero-title .jp-text {
            font-family: 'Noto Serif SC', serif;
            font-size: 0.45em;
            display: block;
            color: var(--text-light);
            font-weight: 400;
            text-shadow: none;
            letter-spacing: 6px;
            margin-top: 10px;
        }

        .hero-sub {
            font-size: clamp(1rem, 2vw, 1.3rem);
            color: var(--text-light);
            max-width: 600px;
            margin-bottom: 40px;
            animation: fadeInUp 1s ease 0.4s both;
            line-height: 1.8;
        }

        .hero-scroll {
            animation: fadeInUp 1s ease 0.6s both;
            margin-top: 40px;
        }

        .hero-scroll a {
            display: inline-flex;
            flex-direction: column;
            align-items: center;
            color: var(--gold);
            text-decoration: none;
            font-size: 13px;
            letter-spacing: 2px;
            gap: 8px;
            transition: all 0.3s;
        }

        .hero-scroll a:hover {
            color: var(--jade-light);
        }

        .scroll-arrow {
            width: 24px;
            height: 40px;
            border: 2px solid var(--gold);
            border-radius: 12px;
            position: relative;
            transition: border-color 0.3s;
        }
        .scroll-arrow::after {
            content: '';
            position: absolute;
            top: 8px;
            left: 50%;
            transform: translateX(-50%);
            width: 4px;
            height: 8px;
            background: var(--gold);
            border-radius: 2px;
            animation: scrollBounce 2s infinite;
        }
        .hero-scroll a:hover .scroll-arrow {
            border-color: var(--jade-light);
        }
        .hero-scroll a:hover .scroll-arrow::after {
            background: var(--jade-light);
        }

        /* ===== 装饰飘落的樱花 ===== */
        .sakura-petal {
            position: fixed;
            top: -20px;
            color: var(--sakura);
            font-size: 20px;
            opacity: 0.5;
            animation: fall linear infinite;
            pointer-events: none;
            z-index: 0;
        }

        /* ===== Section 通用 ===== */
        section {
            padding: 80px 0;
            position: relative;
        }

        .section-title {
            font-family: 'Noto Serif SC', serif;
            font-size: clamp(1.8rem, 4vw, 2.5rem);
            font-weight: 900;
            color: var(--ink-black);
            text-align: center;
            margin-bottom: 15px;
            position: relative;
        }

        .section-title::after {
            content: '';
            display: block;
            width: 80px;
            height: 3px;
            background: linear-gradient(90deg, var(--gold), var(--jade-light));
            margin: 15px auto 0;
            border-radius: 2px;
        }

        .section-subtitle {
            text-align: center;
            color: var(--text-light);
            font-size: 15px;
            max-width: 600px;
            margin: 0 auto 50px;
            letter-spacing: 1px;
        }

        /* ===== 日语印章装饰 ===== */
        .seal {
            display: inline-block;
            width: 70px;
            height: 70px;
            border: 3px solid var(--red-seal);
            color: var(--red-seal);
            font-family: 'Ma Shan Zheng', cursive;
            font-size: 24px;
            line-height: 70px;
            text-align: center;
            transform: rotate(-5deg);
            border-radius: 4px;
            position: absolute;
            right: -30px;
            top: -30px;
            opacity: 0.7;
            box-shadow: 2px 2px 0 rgba(192, 57, 43, 0.2);
        }

        /* ===== 人物卡片网格 ===== */
        .characters-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
            gap: 30px;
            margin-top: 40px;
        }

        .character-card {
            background: white;
            border-radius: 16px;
            padding: 30px 20px;
            text-align: center;
            box-shadow: 0 8px 30px var(--shadow);
            transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
            position: relative;
            border: 1px solid rgba(212, 163, 115, 0.15);
            overflow: hidden;
        }

        .character-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 4px;
            background: linear-gradient(90deg, var(--gold), var(--jade-light));
            opacity: 0;
            transition: opacity 0.3s;
        }

        .character-card:hover::before {
            opacity: 1;
        }

        .character-card:hover {
            transform: translateY(-8px) scale(1.02);
            box-shadow: 0 16px 50px var(--shadow);
        }

        .character-emoji {
            font-size: 48px;
            margin-bottom: 15px;
            display: inline-block;
            animation: float 3s ease-in-out infinite;
        }

        .character-card:nth-child(2) .character-emoji {
            animation-delay: 0.5s;
        }
        .character-card:nth-child(3) .character-emoji {
            animation-delay: 1s;
        }
        .character-card:nth-child(4) .character-emoji {
            animation-delay: 1.5s;
        }

        .character-name {
            font-family: 'Noto Serif SC', serif;
            font-size: 20px;
            font-weight: 700;
            color: var(--ink-dark);
            margin-bottom: 4px;
        }

        .character-name-jp {
            font-size: 14px;
            color: var(--text-light);
            margin-bottom: 12px;
            letter-spacing: 2px;
        }

        .character-label {
            display: inline-block;
            background: linear-gradient(135deg, var(--gold-light), var(--parchment));
            color: var(--ink-dark);
            padding: 4px 16px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 500;
            margin-bottom: 12px;
        }

        .character-desc {
            font-size: 14px;
            color: var(--text-light);
            line-height: 1.7;
        }

        .character-card .quote {
            font-style: italic;
            color: var(--jade-dark);
            font-size: 13px;
            margin-top: 12px;
            padding: 10px;
            background: rgba(83, 168, 182, 0.08);
            border-radius: 8px;
            border-left: 3px solid var(--jade-light);
        }

        /* ===== 组会对话 ===== */
        .group-meeting {
            background: linear-gradient(135deg, var(--parchment), var(--washi));
            border-radius: 20px;
            padding: 50px 40px;
            margin: 40px 0;
            position: relative;
            border: 1px solid rgba(212, 163, 115, 0.2);
            box-shadow: 0 10px 40px var(--shadow);
        }

        .group-meeting::before {
            content: '📋 课题组第2500次会议记录';
            position: absolute;
            top: -14px;
            left: 30px;
            background: var(--gold);
            color: white;
            padding: 4px 20px;
            border-radius: 20px;
            font-size: 13px;
            font-weight: 500;
            letter-spacing: 1px;
        }

        .dialogue {
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        .dialogue-item {
            display: flex;
            align-items: flex-start;
            gap: 15px;
            opacity: 0;
            transform: translateY(20px);
            transition: all 0.6s ease;
        }

        .dialogue-item.visible {
            opacity: 1;
            transform: translateY(0);
        }

        .dialogue-avatar {
            width: 48px;
            height: 48px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 24px;
            flex-shrink: 0;
            box-shadow: 0 4px 10px var(--shadow);
        }

        .dialogue-avatar.kongzi {
            background: linear-gradient(135deg, #c0392b, #e74c3c);
        }
        .dialogue-avatar.zilu {
            background: linear-gradient(135deg, #e67e22, #f39c12);
        }
        .dialogue-avatar.zengxi {
            background: linear-gradient(135deg, #27ae60, #2ecc71);
        }
        .dialogue-avatar.ranyou {
            background: linear-gradient(135deg, #2980b9, #3498db);
        }
        .dialogue-avatar.gongxi {
            background: linear-gradient(135deg, #8e44ad, #9b59b6);
        }

        .dialogue-bubble {
            background: white;
            padding: 16px 22px;
            border-radius: 16px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.06);
            max-width: 80%;
            position: relative;
            flex: 1;
        }

        .dialogue-bubble .name {
            font-weight: 700;
            font-size: 14px;
            margin-bottom: 4px;
        }
        .dialogue-bubble .name.kongzi-name {
            color: #c0392b;
        }
        .dialogue-bubble .name.zilu-name {
            color: #e67e22;
        }
        .dialogue-bubble .name.zengxi-name {
            color: #27ae60;
        }
        .dialogue-bubble .name.ranyou-name {
            color: #2980b9;
        }
        .dialogue-bubble .name.gongxi-name {
            color: #8e44ad;
        }

        .dialogue-bubble .text {
            font-size: 15px;
            line-height: 1.7;
        }
        .dialogue-bubble .text .jp {
            color: var(--text-light);
            font-size: 13px;
            display: block;
            margin-top: 4px;
        }

        .dialogue-item.right {
            flex-direction: row-reverse;
        }
        .dialogue-item.right .dialogue-bubble {
            background: var(--ink-dark);
            color: white;
        }
        .dialogue-item.right .dialogue-bubble .name {
            color: var(--gold-light);
        }
        .dialogue-item.right .dialogue-bubble .text {
            color: rgba(255, 255, 255, 0.9);
        }
        .dialogue-item.right .dialogue-bubble .text .jp {
            color: rgba(255, 255, 255, 0.6);
        }

        /* ===== 原文对照 ===== */
        .original-text {
            background: white;
            border-radius: 16px;
            padding: 40px;
            margin: 40px 0;
            box-shadow: 0 8px 30px var(--shadow);
            border: 1px solid rgba(212, 163, 115, 0.15);
        }

        .original-text .classic {
            font-family: 'Noto Serif SC', serif;
            font-size: 16px;
            line-height: 2.2;
            color: var(--ink-dark);
        }

        .original-text .classic .line {
            padding: 4px 0;
            border-bottom: 1px dashed rgba(0,0,0,0.05);
        }

        .original-text .classic .line:last-child {
            border-bottom: none;
        }

        .original-text .classic .annotation {
            font-size: 13px;
            color: var(--text-light);
            font-family: 'Noto Sans SC', sans-serif;
            margin-left: 8px;
        }

        /* ===== 评论卡片 ===== */
        .comments-section {
            margin-top: 40px;
        }

        .comment-card {
            background: white;
            border-radius: 16px;
            padding: 25px 30px;
            box-shadow: 0 4px 20px var(--shadow);
            border-left: 4px solid var(--gold);
            margin-bottom: 20px;
            transition: all 0.3s;
        }

        .comment-card:hover {
            transform: translateX(8px);
            box-shadow: 0 8px 30px var(--shadow);
        }

        .comment-card .comment-header {
            display: flex;
            align-items: center;
            gap: 12px;
            margin-bottom: 12px;
        }

        .comment-card .comment-avatar {
            width: 36px;
            height: 36px;
            border-radius: 50%;
            background: linear-gradient(135deg, var(--gold-light), var(--jade-light));
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 16px;
            color: white;
            font-weight: 700;
        }

        .comment-card .comment-user {
            font-weight: 600;
            font-size: 14px;
        }

        .comment-card .comment-time {
            font-size: 12px;
            color: var(--text-light);
            margin-left: auto;
        }

        .comment-card .comment-text {
            font-size: 15px;
            line-height: 1.8;
            color: var(--text-main);
        }

        .comment-card .comment-text .tag {
            display: inline-block;
            background: var(--parchment);
            padding: 2px 10px;
            border-radius: 12px;
            font-size: 12px;
            color: var(--text-light);
            margin: 2px;
        }

        .comment-card .comment-likes {
            margin-top: 10px;
            font-size: 13px;
            color: var(--text-light);
            display: flex;
            align-items: center;
            gap: 6px;
        }

        /* ===== 趣图区 ===== */
        .meme-gallery {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
            margin: 40px 0;
        }

        .meme-item {
            background: white;
            border-radius: 16px;
            overflow: hidden;
            box-shadow: 0 8px 25px var(--shadow);
            transition: all 0.3s;
            cursor: pointer;
        }

        .meme-item:hover {
            transform: scale(1.03);
            box-shadow: 0 12px 40px var(--shadow);
        }

        .meme-item .meme-placeholder {
            height: 200px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 64px;
            background: linear-gradient(135deg, var(--parchment), var(--parchment-dark));
            position: relative;
            overflow: hidden;
        }

        .meme-item .meme-placeholder .meme-label {
            position: absolute;
            bottom: 10px;
            left: 10px;
            background: rgba(0,0,0,0.6);
            color: white;
            padding: 4px 12px;
            border-radius: 8px;
            font-size: 12px;
        }

        .meme-item .meme-caption {
            padding: 15px 18px;
            font-size: 14px;
            color: var(--text-main);
            line-height: 1.6;
            text-align: center;
        }

        /* ===== 页脚 ===== */
        footer {
            background: var(--ink-black);
            color: rgba(255,255,255,0.7);
            padding: 50px 20px;
            text-align: center;
            position: relative;
            z-index: 1;
        }

        footer .footer-title {
            font-family: 'Noto Serif SC', serif;
            font-size: 20px;
            color: var(--gold-light);
            margin-bottom: 10px;
        }

        footer .footer-links {
            display: flex;
            justify-content: center;
            gap: 20px;
            margin: 20px 0;
            flex-wrap: wrap;
        }

        footer .footer-links a {
            color: rgba(255,255,255,0.5);
            text-decoration: none;
            font-size: 13px;
            transition: color 0.3s;
        }

        footer .footer-links a:hover {
            color: var(--gold-light);
        }

        footer .copyright {
            font-size: 12px;
            margin-top: 20px;
            opacity: 0.5;
        }

        /* ===== 导航 ===== */
        .nav {
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            z-index: 100;
            padding: 15px 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            background: rgba(250, 246, 237, 0.9);
            backdrop-filter: blur(20px);
            border-bottom: 1px solid rgba(212, 163, 115, 0.15);
            transition: all 0.3s;
        }

        .nav-scrolled {
            box-shadow: 0 2px 20px var(--shadow);
        }

        .nav-logo {
            font-family: 'Ma Shan Zheng', cursive;
            font-size: 24px;
            color: var(--ink-dark);
            text-decoration: none;
        }

        .nav-links {
            display: flex;
            gap: 25px;
            list-style: none;
        }

        .nav-links a {
            text-decoration: none;
            color: var(--text-light);
            font-size: 14px;
            transition: color 0.3s;
            position: relative;
        }

        .nav-links a::after {
            content: '';
            position: absolute;
            bottom: -4px;
            left: 0;
            width: 0;
            height: 2px;
            background: var(--gold);
            transition: width 0.3s;
        }

        .nav-links a:hover {
            color: var(--ink-dark);
        }
        .nav-links a:hover::after {
            width: 100%;
        }

        .nav-hamburger {
            display: none;
            flex-direction: column;
            gap: 5px;
            cursor: pointer;
            background: none;
            border: none;
            padding: 5px;
        }
        .nav-hamburger span {
            width: 24px;
            height: 2px;
            background: var(--ink-dark);
            border-radius: 2px;
            transition: all 0.3s;
        }

        /* ===== 动画 ===== */
        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(40px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes fadeInDown {
            from {
                opacity: 0;
                transform: translateY(-30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes float {
            0%, 100% {
                transform: translateY(0);
            }
            50% {
                transform: translateY(-10px);
            }
        }

        @keyframes scrollBounce {
            0%, 100% {
                transform: translateX(-50%) translateY(0);
                opacity: 1;
            }
            50% {
                transform: translateX(-50%) translateY(8px);
                opacity: 0.5;
            }
        }

        @keyframes fall {
            0% {
                transform: translateY(-10px) rotate(0deg);
                opacity: 0.6;
            }
            100% {
                transform: translateY(100vh) rotate(360deg);
                opacity: 0;
            }
        }

        @keyframes pulse {
            0%, 100% {
                transform: scale(1);
            }
            50% {
                transform: scale(1.05);
            }
        }

        /* ===== 响应式 ===== */
        @media (max-width: 768px) {
            .nav-links {
                display: none;
                position: absolute;
                top: 100%;
                left: 0;
                right: 0;
                background: rgba(250, 246, 237, 0.98);
                backdrop-filter: blur(20px);
                flex-direction: column;
                padding: 20px 30px;
                border-bottom: 1px solid rgba(212, 163, 115, 0.15);
                gap: 15px;
            }
            .nav-links.active {
                display: flex;
            }
            .nav-hamburger {
                display: flex;
            }
            .group-meeting {
                padding: 40px 20px;
            }
            .group-meeting::before {
                left: 20px;
                font-size: 11px;
                padding: 3px 14px;
            }
            .dialogue-bubble {
                max-width: 90%;
            }
            .seal {
                width: 50px;
                height: 50px;
                font-size: 18px;
                line-height: 50px;
                right: -10px;
                top: -10px;
            }
            .original-text {
                padding: 25px;
            }
        }

        @media (max-width: 480px) {
            .hero {
                padding: 100px 15px 40px;
            }
            section {
                padding: 50px 0;
            }
            .character-card {
                padding: 20px 15px;
            }
            .dialogue-item {
                gap: 10px;
            }
            .dialogue-avatar {
                width: 36px;
                height: 36px;
                font-size: 18px;
            }
            .comment-card {
                padding: 18px 20px;
            }
        }

        /* ===== 工具类 ===== */
        .text-center { text-align: center; }
        .mt-20 { margin-top: 20px; }
        .mb-20 { margin-bottom: 20px; }
        .mt-40 { margin-top: 40px; }
        .mb-40 { margin-bottom: 40px; }
        .relative { position: relative; }
    </style>
</head>
<body>

    <!-- ===== 飘落樱花 ===== -->
    <div id="sakura-container"></div>

    <!-- ===== 导航 ===== -->
    <nav class="nav" id="navbar">
        <a href="#" class="nav-logo">孔子課題組</a>
        <button class="nav-hamburger" id="hamburger" aria-label="菜单">
            <span></span><span></span><span></span>
        </button>
        <ul class="nav-links" id="navLinks">
            <li><a href="#story">📖 故事</a></li>
            li><a href="#characters">👥 人物</a></li>
            li><a href="#meeting">💬 组会</a></li>
            <li><a href="#original">📜 原文</a></li>
            <li><a href="#comments">💭 热评</a></li>
        </ul>
    </nav>

    <!-- ===== Hero ===== -->
    <section class="hero" id="hero">
        <div class="container">
            <div class="hero-badge">📌 日专生 · 课题组 · 现代版侍坐</div>
            <h1 class="hero-title">
                孔子课题组
                <span class="jp-text">（日本語研究生版）</span>
            </h1>
            <p class="hero-sub">
                当《论语·侍坐》遇上现代研究生组会<br>
                孔子 × 日语研究生 × 课题组 = 2500年前的学术吐槽现场
            </p>
            <div class="hero-scroll">
                <a href="#story">
                    <span>Scroll Down</span>
                    <div class="scroll-arrow"></div>
                </a>
            </div>
        </div>
    </section>

    <!-- ===== 故事介绍 ===== -->
    <section id="story">
        <div class="container">
            <h2 class="section-title">📖 侍坐 · 现代版</h2>
            <p class="section-subtitle">《子路、曾皙、冉有、公西华侍坐》——一场2500年前的"课题组组会"</p>

            <div class="group-meeting relative">
                <div class="seal">侍坐</div>
                <div class="dialogue">
                    <div class="dialogue-item visible">
                        <div class="dialogue-avatar kongzi">🎓</div>
                        <div class="dialogue-bubble">
                            <div class="name kongzi-name">孔子（导师）</div>
                            <div class="text">
                                说说你们各自的规划吧。
                                <span class="jp">（それぞれの計画を話してみなさい。）</span>
                            </div>
                        </div>
                    </div>

                    <div class="dialogue-item visible right">
                        <div class="dialogue-avatar zilu">⚔️</div>
                        <div class="dialogue-bubble">
                            <div class="name zilu-name">子路（研三·热血事业批）</div>
                            <div class="text">
                                给我一个千乘之国，夹在大国中间的那种，三年！我让它人人有勇气、懂礼法！
                                <span class="jp">（千乘の国を治めさせてください。三年で勇敢にし、礼儀正しくします！）</span>
                            </div>
                        </div>
                    </div>

                    <div class="dialogue-item visible">
                        <div class="dialogue-avatar ranyou">📊</div>
                        <div class="dialogue-bubble">
                            <div class="name ranyou-name">冉有（研二·低调务实型）</div>
                            <div class="text">
                                我嘛……一个小国，能让百姓温饱。礼乐教化这种事，得等君子来。
                                <span class="jp">（私は…小さな国で民を富ませることができます。礼楽は君子を待ちます。）</span>
                            </div>
                        </div>
                    </div>

                    <div class="dialogue-item visible right">
                        <div class="dialogue-avatar gongxi">🎩</div>
                        <div class="dialogue-bubble">
                            <div class="name gongxi-name">公西华（研一·谦虚新人）</div>
                            <div class="text">
                                我不敢说能做什么，只想学着做点礼仪方面的事——宗庙祭祀、外交场合，当个小助手就行。
                                <span class="jp">（私はできませんが、儀礼のことを学びたいです。小さな助手で結構です。）</span>
                            </div>
                        </div>
                    </div>

                    <div class="dialogue-item visible">
                        <div class="dialogue-avatar zengxi">🎵</div>
                        <div class="dialogue-bubble">
                            <div class="name zengxi-name">曾皙（佛系博后·氛围感生活家）</div>
                            <div class="text">
                                我啊……（继续弹琴）<br>
                                春天到了，穿着春服，和五六个朋友、六七个小孩，在沂水边洗澡，在舞雩台吹风，一路唱着歌回家。
                                <span class="jp">（春、春服を着て、友達と子供たちと川で泳ぎ、風に吹かれて歌いながら帰る…それでいいです。）</span>
                            </div>
                        </div>
                    </div>

                    <div class="dialogue-item visible right">
                        <div class="dialogue-avatar kongzi">🎓</div>
                        <div class="dialogue-bubble">
                            <div class="name kongzi-name">孔子（导师·长叹一声）</div>
                            <div class="text" style="font-size: 18px; font-weight: 500;">
                                🌟 吾与点也！（我赞同曾皙啊！）
                                <span class="jp">（私は曽皙に賛成だ！）</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div style="text-align: center; margin-top: 30px; font-size: 15px; color: var(--text-light);">
                <p>💡 孔子为什么独爱"佛系"回答？因为曾皙描绘的春日郊游，其实是天下太平后的缩影——<br>
                人们不必忧心战争饥荒，才能有闲情逸致。这暗合孔子"大同社会"的梦想。</p>
            </div>
        </div>
    </section>

    <!-- ===== 人物介绍 ===== -->
    <section id="characters" style="background: linear-gradient(180deg, var(--washi), var(--parchment));">
        <div class="container">
            <h2 class="section-title">👥 课题组人物设定</h2>
            <p class="section-subtitle">四位弟子 + 一位导师 = 经典课题组结构</p>

            <div class="characters-grid">
                <div class="character-card">
                    <div class="character-emoji">🎓</div>
                    <div class="character-name">孔子</div>
                    <div class="character-name-jp">こうし / Confucius</div>
                    <div class="character-label">👑 大老板·导师</div>
                    <div class="character-desc">
                        成名已久的一方大佬，徒子徒孙众多。极度push，每次组会轮流发言，还会突然点名："刚才师兄说的，你怎么看？"
                    </div>
                    <div class="quote">"三千弟子，就72个满足毕业条件。"</div>
                </div>

                <div class="character-card">
                    <div class="character-emoji">⚔️</div>
                    <div class="character-name">子路</div>
                    <div class="character-name-jp">しろ / Zilu</div>
                    <div class="character-label">🔥 热血事业批</div>
                    <div class="character-desc">
                        研三大师兄，冲在第一线。开口就要搞大项目，PPT写得最猛，但导师只是微笑不语（内心OS：年轻人，谦逊点）。
                    </div>
                    <div class="quote">"给我一个大国，三年让它变强国！"</div>
                </div>

                <div class="character-card">
                    <div class="character-emoji">📊</div>
                    <div class="character-name">冉有</div>
                    <div class="character-name-jp">ぜんゆう / Ranyou</div>
                    <div class="character-label">💼 低调务实组</div>
                    <div class="character-desc">
                        研二，话不多但能干实事。说自己只能搞经济，被导师急得不行："你明明能干大事！" 谦虚得让老板着急。
                    </div>
                    <div class="quote">"我能让百姓温饱，礼乐就算了…"</div>
                </div>

                <div class="character-card">
                    <div class="character-emoji">🎩</div>
                    <div class="character-name">公西华</div>
                    <div class="character-name-jp">こうせいか / Gongxihua</div>
                    <div class="character-label">🙇 谦虚新人</div>
                    <div class="character-desc">
                        研一刚进组，什么都不敢说。只想做点礼仪方面的辅助工作，当个"小助手"就行——导师内心：你以后可不得了。
                    </div>
                    <div class="quote">"我不敢说能做什么…学点礼仪就好。"</div>
                </div>

                <div class="character-card">
                    <div class="character-emoji">🎵</div>
                    <div class="character-name">曾皙</div>
                    <div class="character-name-jp">そうせき / Zengxi</div>
                    <div class="character-label">🌸 佛系生活家</div>
                    <div class="character-desc">
                        组会上还在旁边弹琴（干自己的事），被导师突然提问："刚师兄说的，你怎么看？" 结果他的回答让所有人破防。
                    </div>
                    <div class="quote">"春天游泳、吹风、唱歌回家——我就想这样。"</div>
                </div>
            </div>
        </div>
    </section>

    <!-- ===== 组会吐槽 ===== -->
    <section id="meeting">
        <div class="container">
            <h2 class="section-title">💬 侍坐 = 孔子的组会</h2>
            <p class="section-subtitle">当古典遇上当代研究生生存图鉴</p>

            <div class="group-meeting" style="background: linear-gradient(135deg, var(--ink-dark), #1a1a2e); color: white;">
                <div style="position: absolute; top: -14px; left: 30px; background: var(--red-seal); color: white; padding: 4px 20px; border-radius: 20px; font-size: 13px; font-weight: 500;">
                    🔥 当代研究生锐评
                </div>
                <div style="display: flex; flex-direction: column; gap: 25px; margin-top: 20px;">
                    <div style="padding: 20px; background: rgba(255,255,255,0.08); border-radius: 12px; border-left: 4px solid var(--gold);">
                        <div style="font-weight: 700; color: var(--gold-light); margin-bottom: 8px;">📌 组会本质</div>
                        <p>侍坐其实是孔子的组会——导师是成名已久的一方大佬，徒子徒孙众多，还超级push。所有人每次组会轮流发言，哪怕你装模作样在旁边弹琴助兴也会被提问：</p>
                        <p style="margin-top: 10px; font-style: italic; color: var(--sakura);">"刚师兄说的，你怎么看？"</p>
                    </div>

                    <div style="padding: 20px; background: rgba(255,255,255,0.08); border-radius: 12px; border-left: 4px solid var(--red-seal);">
                        <div style="font-weight: 700; color: var(--sakura); margin-bottom: 8px;">📌 毕业率</div>
                        <p>更可悲的是，毕业率低——3000弟子就72个被孔导判断为满足毕业条件，成了小老板或者大弟子，其他都搁那里延毕。</p>
                    </div>

                    <div style="padding: 20px; background: rgba(255,255,255,0.08); border-radius: 12px; border-left: 4px solid var(--jade-light);">
                        <div style="font-weight: 700; color: var(--jade-light); margin-bottom: 8px;">📌 导师日常</div>
                        <p>而大老板每天组会干什么呢？除了提问题，就在锐评弟子志向——从夯到拉。</p>
                        <p style="margin-top: 10px; font-size: 13px; opacity: 0.7;">#从夯到拉 #研究生组会 #国学里的回响 #导师 #中国哲学 #这个世界是个草台班子</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- ===== 原文对照 ===== -->
    <section id="original" style="background: var(--washi);">
        <div class="container">
            <h2 class="section-title">📜 原文《子路、曾皙、冉有、公西华侍坐》</h2>
            <p class="section-subtitle">选自《论语·先进》—— 标题为后人所加</p>

            <div class="original-text">
                <div class="classic">
                    <div class="line">子路、曾皙、冉有、公西华侍坐。</div>
                    <div class="line">子曰：「以吾一日长乎尔，毋吾以也。居则曰：『不吾知也！』如或知尔，则何以哉？」</div>
                    <div class="line">子路率尔而对曰：「千乘之国，摄乎大国之间，加之以师旅，因之以饥馑；由也为之，比及三年，可使有勇，且知方也。」</div>
                    <div class="line">夫子哂之。</div>
                    <div class="line">「求，尔何如？」</div>
                    <div class="line">对曰：「方六七十，如五六十，求也为之，比及三年，可使足民。如其礼乐，以俟君子。」</div>
                    <div class="line">「赤，尔何如？」</div>
                    <div class="line">对曰：「非曰能之，愿学焉。宗庙之事，如会同，端章甫，愿为小相焉。」</div>
                    <div class="line">「点，尔何如？」</div>
                    <div class="line">鼓瑟希，铿尔，舍瑟而作，对曰：「异乎三子者之撰。」</div>
                    <div class="line">子曰：「何伤乎？亦各言其志也。」</div>
                    <div class="line">曰：「莫春者，春服既成，冠者五六人，童子六七人，浴乎沂，风乎舞雩，咏而归。」</div>
                    <div class="line">夫子喟然叹曰：「吾与点也！」</div>
                </div>
            </div>

            <div style="display: flex; gap: 15px; justify-content: center; flex-wrap: wrap; margin-top: 20px;">
                <span class="tag" style="background: var(--gold-light); padding: 6px 18px; border-radius: 20px; font-size: 13px;">🏷️ 古文</span>
                <span class="tag" style="background: var(--gold-light); padding: 6px 18px; border-radius: 20px; font-size: 13px;">🏷️ 语文</span>
                <span class="tag" style="background: var(--gold-light); padding: 6px 18px; border-radius: 20px; font-size: 13px;">🏷️ 论语</span>
                <span class="tag" style="background: var(--gold-light); padding: 6px 18px; border-radius: 20px; font-size: 13px;">🏷️ 孔子</span>
                <span class="tag" style="background: var(--gold-light); padding: 6px 18px; border-radius: 20px; font-size: 13px;">🏷️ 中职语文</span>
            </div>
        </div>
    </section>

    <!-- ===== 趣图区 ===== -->
    <section>
        <div class="container">
            <h2 class="section-title">🎭 课题组的日常</h2>
            <p class="section-subtitle">当2500年前的对话变成今天的朋友圈</p>

            <div class="meme-gallery">
                <div class="meme-item">
                    <div class="meme-placeholder" style="font-size: 60px; background: linear-gradient(135deg, #fce4e4, #f7c5c5);">
                        🎓📋
                        <span class="meme-label">孔子：开组会了</span>
                    </div>
                    <div class="meme-caption">孔子导师在群里发了一句："今天下午3点组会，都来。"<br>全员秒回："收到👌"</div>
                </div>

                <div class="meme-item">
                    <div class="meme-placeholder" style="font-size: 60px; background: linear-gradient(135deg, #e8dcc8, #f5edd6);">
                        ⚔️💬
                        <span class="meme-label">子路：我先说！</span>
                    </div>
                    <div class="meme-caption">每次组会抢着第一个汇报，PPT做了80页<br>导师：微笑.jpg（内心：这孩子还是太年轻）</div>
                </div>

                <div class="meme-item">
                    <div class="meme-placeholder" style="font-size: 60px; background: linear-gradient(135deg, #d4e8d4, #b8d8b8);">
                        🎵😌
                        <span class="meme-label">曾皙：我在弹琴</span>
                    </div>
                    <div class="meme-caption">组会上悠然自得干自己的事<br>结果被导师点名："曾皙，你怎么看？"<br>他：啊？？？</div>
                </div>

                <div class="meme-item">
                    <div class="meme-placeholder" style="font-size: 60px; background: linear-gradient(135deg, #d4d8e8, #b8c0d8);">
                        😂📜
                        <span class="meme-label">毕业率2.4%</span>
                    </div>
                    <div class="meme-caption">孔子课题组：3000人入学，72人毕业<br>延毕率 97.6% 🔥 #这个世界是个草台班子</div>
                </div>
            </div>
        </div>
    </section>

    <!-- ===== 评论区 ===== -->
    <section id="comments" style="background: linear-gradient(180deg, var(--parchment), var(--washi));">
        <div class="container">
            <h2 class="section-title">💭 网友热评</h2>
            <p class="section-subtitle">来自小红书的精彩评论——"侍坐是孔子的组会"</p>

            <div class="comments-section">
                <div class="comment-card">
                    <div class="comment-header">
                        <div class="comment-avatar">🍭</div>
                        <div class="comment-user">🍭</div>
                        <div class="comment-time">6天前 · 浙江</div>
                    </div>
                    <div class="comment-text">
                        <p>侍坐其实是孔子的组会，导师是成名已久的一方大佬，徒子徒孙众多，还超极push，所有人每次组会轮流发言，哪怕你装模作样在旁边弹琴助兴也会被提问：<strong>"刚师兄说的，你怎么看"</strong></p>
                        <p style="margin-top: 10px;">更可悲的是，毕业率低，3000弟子就72个被孔导判断为满足毕业条件，成了小老板，或者大弟子，其他都搁那里延毕</p>
                        <p style="margin-top: 10px;">而大老板每天组会干什么呢？除了提问题，就在锐评弟子志向——<strong>从夯到拉</strong></p>
                        <div style="margin-top: 12px; display: flex; gap: 6px; flex-wrap: wrap;">
                            <span class="tag">#从夯到拉</span>
                            <span class="tag">#研究生组会</span>
                            <span class="tag">#国学里的回响</span>
                            <span class="tag">#导师</span>
                            <span class="tag">#中国哲学</span>
                            <span class="tag">#这个世界是个草台班子</span>
                        </div>
                    </div>
                    <div class="comment-likes">❤️ 1.2万 · 💬 456 · 🔗 分享</div>
                </div>

                <div class="comment-card">
                    <div class="comment-header">
                        <div class="comment-avatar">📚</div>
                        <div class="comment-user">Smirnova</div>
                        <div class="comment-time">2026-04-21 · 广东</div>
                    </div>
                    <div class="comment-text">
                        <p><strong>孔子：说说你们的规划吧</strong></p>
                        <p style="margin-top: 6px;">这是我创作的孔子课题组（日语研究生版）。起因是我看到别的专业写的孔子侍坐。用日语研究生的视角重新解读《子路、曾皙、冉有、公西华侍坐》，突然觉得这根本就是一场现代课题组组会啊！</p>
                        <div style="margin-top: 12px; display: flex; gap: 6px; flex-wrap: wrap;">
                            <span class="tag">#日专生</span>
                            <span class="tag">#日语研究生</span>
                            <span class="tag">#读研哪有不疯的</span>
                            <span class="tag">#课题组</span>
                            <span class="tag">#孔子课题组</span>
                            <span class="tag">#读研</span>
                        </div>
                    </div>
                    <div class="comment-likes">❤️ 8560 · 💬 234 · 🔗 分享</div>
                </div>

                <div class="comment-card">
                    <div class="comment-header">
                        <div class="comment-avatar">🌸</div>
                        <div class="comment-user">小其木格</div>
                        <div class="comment-time">2025-11-29</div>
                    </div>
                    <div class="comment-text">
                        <p>✨ 《侍坐》里藏着孔子最喜欢的"
