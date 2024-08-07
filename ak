<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>DentAI Synergy</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&family=Montserrat:wght@300;400;600;700&display=swap" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <style>
        :root {
            --primary-color: #4a90e2;
            --secondary-color: #5cb85c;
            --text-color: #333333;
            --background-color: #f5f7fa;
            --card-background: #ffffff;
            --hover-color: #e8f0fe;
            --error-color: #d9534f;
        }

        body {
            font-family: 'Poppins', sans-serif;
            color: var(--text-color);
            margin: 0;
            padding: 0;
            background-color: var(--background-color);
            min-height: 100vh;
            transition: background-color 0.3s ease;
        }

        body.dark-theme {
            --primary-color: #64b5f6;
            --secondary-color: #81c784;
            --text-color: #e0e0e0;
            --background-color: #263238;
            --card-background: #37474f;
            --hover-color: #455a64;
            --error-color: #ef5350;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 40px 20px;
        }

        .header {
            text-align: center;
            margin-bottom: 40px;
        }

        .logo {
            font-family: 'Montserrat', sans-serif;
            font-size: 48px;
            font-weight: 700;
            color: var(--primary-color);
            margin-bottom: 10px;
        }

        .logo span.ai {
            color: var(--secondary-color);
        }

        .subtitle {
            font-size: 18px;
            font-weight: 400;
            color: var(--text-color);
        }

        .login-box, .dashboard {
            background-color: var(--card-background);
            border-radius: 10px;
            padding: 40px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            margin: 0 auto;
        }

        .dashboard {
            max-width: 100%;
            display: none;
        }

        .input-group {
            margin-bottom: 20px;
        }

        .input-group input {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 16px;
        }

        .remember-forgot {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }

        .remember-forgot a {
            color: var(--primary-color);
            text-decoration: none;
        }

        .button {
            width: 100%;
            padding: 10px;
            border: none;
            border-radius: 5px;
            background-color: var(--primary-color);
            color: white;
            font-size: 18px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .button:hover {
            background-color: #3a7bd5;
        }

        .dashboard-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
        }

        .user-controls {
            display: flex;
            gap: 10px;
        }

        .modules-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
            margin-bottom: 30px;
        }

        .module-card {
            background-color: var(--card-background);
            border-radius: 10px;
            padding: 20px;
            text-align: center;
            cursor: pointer;
            transition: transform 0.3s, background-color 0.3s;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .module-card:hover {
            transform: translateY(-5px);
            background-color: var(--hover-color);
        }

        .module-card i {
            color: var(--primary-color);
            margin-bottom: 10px;
        }

        .recent-cases, .for-you {
            background-color: var(--card-background);
            border-radius: 10px;
            padding: 20px;
            margin-bottom: 30px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .new-case-button {
            position: fixed;
            bottom: 30px;
            right: 30px;
            width: 60px;
            height: 60px;
            border-radius: 50%;
            background-color: var(--secondary-color);
            color: white;
            font-size: 24px;
            border: none;
            cursor: pointer;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            transition: background-color 0.3s;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .new-case-button:hover {
            background-color: #4cae4c;
        }

        .sidebar {
            position: fixed;
            left: -250px;
            top: 0;
            width: 250px;
            height: 100%;
            background-color: var(--card-background);
            transition: left 0.3s ease;
            z-index: 1000;
            padding-top: 60px;
            box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
        }

        .sidebar.active {
            left: 0;
        }

        .sidebar-toggle {
            position: fixed;
            left: 10px;
            top: 10px;
            z-index: 1001;
            background: none;
            border: none;
            color: var(--text-color);
            font-size: 24px;
            cursor: pointer;
        }

        .sidebar-menu {
            list-style-type: none;
            padding: 0;
            margin: 0;
        }

        .sidebar-menu li {
            padding: 10px 20px;
        }

        .sidebar-menu li a {
            color: var(--text-color);
            text-decoration: none;
            display: flex;
            align-items: center;
        }

        .sidebar-menu li a i {
            margin-right: 10px;
            color: var(--primary-color);
        }

        .error-message {
            color: var(--error-color);
            background-color: rgba(217, 83, 79, 0.1);
            border-radius: 5px;
            padding: 10px;
            margin-top: 10px;
            display: none;
        }

        #keyboard-shortcuts {
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background-color: var(--card-background);
            padding: 20px;
            border-radius: 10px;
            z-index: 1002;
            display: none;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .module-page {
            display: none;
            padding: 20px;
            background-color: var(--card-background);
            border-radius: 10px;
            margin-top: 20px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .module-page h2 {
            color: var(--primary-color);
            margin-bottom: 20px;
        }

        .module-step {
            margin-bottom: 20px;
        }

        .module-step h3 {
            color: var(--secondary-color);
            margin-bottom: 10px;
        }

        .module-step select,
        .module-step input[type="text"],
        .module-step input[type="file"],
        .module-step textarea {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 16px;
            background-color: var(--background-color);
            color: var(--text-color);
        }

        .module-step button {
            background-color: var(--primary-color);
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            margin-top: 10px;
        }

        .module-step button:hover {
            background-color: #3a7bd5;
        }

        @media (max-width: 768px) {
            .modules-grid {
                grid-template-columns: 1fr;
            }
            .dashboard-header {
                flex-direction: column;
                align-items: flex-start;
            }
            .user-controls {
                margin-top: 20px;
            }
        }
    </style>
</head>
<body>
    <button class="sidebar-toggle">
        <i class="fas fa-bars"></i>
    </button>
    <div class="sidebar">
        <ul class="sidebar-menu">
            <li><a href="#"><i class="fas fa-home"></i> Dashboard</a></li>
            <li><a href="#"><i class="fas fa-tooth"></i> Crown & Bridge</a></li>
            <li><a href="#"><i class="fas fa-smile"></i> Smile Design</a></li>
            <li><a href="#"><i class="fas fa-chart-bar"></i> Removable Prosthetics</a></li>
            <li><a href="#"><i class="fas fa-cog"></i> Implant Planning</a></li>
            <li><a href="#"><i class="fas fa-user-md"></i> Maxillofacial Prosthetics</a></li>
            <li><a href="#"><i class="fas fa-syringe"></i> Endodontic Guide</a></li>
        </ul>
    </div>
    <div class="container">
        <div class="header">
            <div class="logo">Dent<span class="ai">AI</span> Synergy</div>
            <div class="subtitle">Fusing human expertise with AI vision</div>
        </div>
        
        <!-- Login Screen -->
        <div class="login-box">
            <form id="login-form">
                <div class="input-group">
                    <input type="text" id="username" placeholder="Username" required>
                </div>
                <div class="input-group">
                    <input type="password" id="password" placeholder="Password" required>
                </div>
                <div class="remember-forgot">
                    <label>
                        <input type="checkbox"> Remember Me
                    </label>
                    <a href="#">Forgot Password?</a>
                </div>
                <button type="submit" class="button">Login</button>
            </form>
        </div>

        <!-- Dashboard -->
        <div class="dashboard">
            <div class="dashboard-header">
                <h2>Welcome, <span id="user-name"></span></h2>
                <div class="user-controls">
                    <button class="button">Settings</button>
                    <button class="button">Profile</button>
                    <button id="theme-toggle" class="button">Toggle Theme</button>
                </div>
            </div>
            <div class="modules-grid">
                <div class="module-card" data-module="crown-bridge">
                    <i class="fas fa-tooth fa-3x"></i>
                    <h3>Crown & Bridge</h3>
                </div>
                <div class="module-card" data-module="smile-design">
                    <i class="fas fa-smile fa-3x"></i>
                    <h3>Smile Design</h3>
                </div>
                <div class="module-card" data-module="removable-denture">
                    <i class="fas fa-chart-bar fa-3x"></i>
                    <h3>Removable Denture</h3>
                </div>
                <div class="module-card" data-module="implant-planning">
                    <i class="fas fa-cog fa-3x"></i>
                    <h3>Implant Planning</h3>
                </div>
                <div class="module-card" data-module="maxillofacial-prosthesis">
                    <i class="fas fa-user-md fa-3x"></i>
                    <h3>Maxillofacial Prosthetics</h3>
                </div>
                <div class="module-card" data-module="endodontic-guide">
                    <i class="fas fa-syringe fa-3x"></i>
                    <h3>Endodontic Guide</h3>
                </div>
            </div>
            <div class="recent-cases">
                <h3>Recent Cases</h3>
                <p>No recent cases to display.</p>
            </div>
            <div class="for-you">
                <h3>For You</h3>
                <p>No personalized suggestions available at the moment.</p>
            </div>
            <button class="new-case-button">
                <i class="fas fa-plus"></i>
            </button>

            <!-- Crown & Bridge Module -->
            <div id="crown-bridge-module" class="module-page">
                <h2>Crown & Bridge Module</h2>
                <div class="module-step">
                    <h3>Step 1: Treatment Type Selection</h3>
                    <select id="cb-treatment-type">
                        <option>Select Treatment Type</option>
                        <option>Crown (tooth or implant-supported)</option>
                        <option>Bridge (tooth or implant-supported)</option>
                        <option>Veneer</option>
                        <option>Inlay/Onlay</option>
                    </select>
                </div>
                <div class="module-step">
                    <h3>Step 2: Subtype Selection</h3>
                    <select id="cb-subtype">
                        <option>Select Subtype</option>
                        <option>Anatomic</option>
                        <option>Cut-back</option>
                        <option>Provisional</option>
                        <option>Survey crown</option>
                    </select>
                </div>
                <div class="module-step">
                    <div class="module-step">
                        <h3>Step 3: Tooth/Implant Selection</h3>
                        <input type="text" id="cb-tooth-selection" placeholder="Enter tooth numbers">
                    </div>
                    <div class="module-step">
                        <h3>Step 4: Material Selection</h3>
                        <select id="cb-material">
                            <option>Select Material</option>
                            <option>Zirconia</option>
                            <option>e.max</option>
                            <option>PFM</option>
                            <option>Gold</option>
                        </select>
                    </div>
                    <div class="module-step">
                        <h3>Step 5: Scan Requirements</h3>
                        <input type="file" id="cb-scan-upload" multiple>
                    </div>
                    <div class="module-step">
                        <h3>Step 6: Design Source Selection</h3>
                        <select id="cb-design-source">
                            <option>Select Design Source</option>
                            <option>Library tooth</option>
                            <option>Pre-op or wax-up scan</option>
                            <option>Previously designed wax-up</option>
                            <option>Mirror tooth from opposite side</option>
                        </select>
                    </div>
                    <div class="module-step">
                        <h3>Step 7: Margin Line Drawing</h3>
                        <button id="cb-ai-margins">Generate AI-suggested margins</button>
                    </div>
                    <div class="module-step">
                        <h3>Step 8: Implant Connection Design</h3>
                        <select id="cb-implant-connection">
                            <option>Select Implant System</option>
                            <option>System A</option>
                            <option>System B</option>
                            <option>System C</option>
                        </select>
                    </div>
                    <div class="module-step">
                        <h3>Step 9: Design Parameter Setting</h3>
                        <input type="number" id="cb-min-thickness" placeholder="Minimum thickness">
                        <input type="number" id="cb-cement-gap" placeholder="Cement gap">
                        <input type="number" id="cb-occlusal-contact" placeholder="Occlusal contact strength">
                        <input type="number" id="cb-proximal-contact" placeholder="Proximal contact strength">
                    </div>
                    <div class="module-step">
                        <h3>Step 10: AI Design Generation</h3>
                        <button id="cb-generate-design">Generate AI Design</button>
                    </div>
                    <div class="module-step">
                        <h3>Step 11: Design Modification</h3>
                        <button id="cb-modify-design">Open Design Modification Tools</button>
                    </div>
                    <div class="module-step">
                        <h3>Step 12: Antagonist and Proximal Contact Adjustment</h3>
                        <button id="cb-adjust-contacts">Adjust Contacts</button>
                    </div>
                    <div class="module-step">
                        <h3>Step 13: Quality Check</h3>
                        <button id="cb-quality-check">Run Quality Check</button>
                    </div>
                    <div class="module-step">
                        <h3>Step 14: Finalization</h3>
                        <button id="cb-finalize">Finalize Design</button>
                    </div>
                    </div>

                    <!-- Smile Design Module -->
                    <div id="smile-design-module" class="module-page">
                    <h2>Smile Design Module</h2>
                    <div class="module-step">
                        <h3>Step 1: Treatment Scope Selection</h3>
                        <select id="sd-treatment-scope">
                            <option>Select Treatment Scope</option>
                            <option>Full smile makeover</option>
                            <option>Partial smile design</option>
                        </select>
                    </div>
                    <div class="module-step">
                        <h3>Step 2: Restoration Type Selection</h3>
                        <select id="sd-restoration-type">
                            <option>Select Restoration Type</option>
                            <option>Veneers</option>
                            <option>Crowns</option>
                            <option>Combination of veneers and crowns</option>
                        </select>
                    </div>
                    <div class="module-step">
                        <h3>Step 3: Tooth Selection</h3>
                        <input type="text" id="sd-tooth-selection" placeholder="Enter tooth numbers">
                    </div>
                    <div class="module-step">
                        <h3>Step 4: Scan Requirements</h3>
                        <input type="file" id="sd-scan-upload" multiple>
                    </div>
                    <div class="module-step">
                        <h3>Step 5: Photo Upload</h3>
                        <input type="file" id="sd-photo-upload" multiple accept="image/*">
                    </div>
                    <div class="module-step">
                        <h3>Step 6: Facial Analysis</h3>
                        <button id="sd-facial-analysis">Run Facial Analysis</button>
                    </div>
                    <div class="module-step">
                        <h3>Step 7: Design Source Selection</h3>
                        <select id="sd-design-source">
                            <option>Select Design Source</option>
                            <option>Library tooth sets</option>
                            <option>Pre-op or wax-up scan</option>
                            <option>Previously designed wax-up</option>
                            <option>Customized tooth shapes based on facial features</option>
                        </select>
                    </div>
                    <div class="module-step">
                        <h3>Step 8: Smile Arc Design</h3>
                        <button id="sd-generate-smile-arc">Generate Smile Arc</button>
                    </div>
                    <div class="module-step">
                        <h3>Step 9: Tooth Positioning</h3>
                        <button id="sd-position-teeth">Position Teeth</button>
                    </div>
                    <div class="module-step">
                        <h3>Step 10: Tooth Shape and Size Customization</h3>
                        <button id="sd-customize-teeth">Customize Teeth</button>
                    </div>
                    <div class="module-step">
                        <h3>Step 11: Gingival Contouring</h3>
                        <button id="sd-contour-gingiva">Contour Gingiva</button>
                    </div>
                    <div class="module-step">
                        <h3>Step 12: Color and Shade Selection</h3>
                        <input type="text" id="sd-shade-selection" placeholder="Enter desired shade">
                    </div>
                    <div class="module-step">
                        <h3>Step 13: 3D Wax-up Generation</h3>
                        <button id="sd-generate-waxup">Generate 3D Wax-up</button>
                    </div>
                    <div class="module-step">
                        <h3>Step 14: Design Modification</h3>
                        <button id="sd-modify-design">Modify Design</button>
                    </div>
                    <div class="module-step">
                        <h3>Step 15: Occlusion Check</h3>
                        <button id="sd-check-occlusion">Check Occlusion</button>
                    </div>
                    <div class="module-step">
                        <h3>Step 16: Treatment Simulation</h3>
                        <button id="sd-simulate-treatment">Generate Simulation</button>
                    </div>
                    <div class="module-step">
                        <h3>Step 17: Preparation Guide Design</h3>
                        <button id="sd-design-prep-guide">Design Preparation Guide</button>
                    </div>
                    <div class="module-step">
                        <h3>Step 18: Quality Check</h3>
                        <button id="sd-quality-check">Run Quality Check</button>
                    </div>
                    <div class="module-step">
                        <h3>Step 19: Finalization</h3>
                        <button id="sd-finalize">Finalize Design</button>
                    </div>
                    </div>

                    <!-- Removable Denture Module -->
                    <div id="removable-denture-module" class="module-page">
                    <h2>Removable Denture Module</h2>
                    <div class="module-step">
                        <h3>Step 1: Denture Type Selection</h3>
                        <select id="rd-denture-type">
                            <option>Select Denture Type</option>
                            <option>Complete denture</option>
                            <option>Partial denture</option>
                        </select>
                    </div>
                    <div class="module-step">
                        <h3>Step 2: Arch Selection</h3>
                        <select id="rd-arch-selection">
                            <option>Select Arch</option>
                            <option>Maxillary</option>
                            <option>Mandibular</option>
                            <option>Both</option>
                        </select>
                    </div>
                    <div class="module-step">
                        <h3>Step 3: Design Stage Selection</h3>
                        <select id="rd-design-stage">
                            <option>Select Design Stage</option>
                            <option>Custom tray</option>
                            <option>Wax rim</option>
                            <option>Teeth setup</option>
                            <option>Final denture</option>
                        </select>
                    </div>
                    <div class="module-step">
                        <h3>Step 4: Scan Requirements</h3>
                        <input type="file" id="rd-scan-upload" multiple>
                    </div>
                    <div class="module-step">
                        <h3>Step 5: Facial Scan and Photo Upload</h3>
                        <input type="file" id="rd-facial-upload" multiple accept="image/*">
                    </div>
                    <div class="module-step">
                        <h3>Step 6: Custom Tray Design</h3>
                        <button id="rd-design-tray">Design Custom Tray</button>
                    </div>
                    <div class="module-step">
                        <h3>Step 7: Wax Rim Design</h3>
                        <button id="rd-design-wax-rim">Design Wax Rim</button>
                    </div>
                    <div class="module-step">
                        <h3>Step 8: Vertical Dimension and Centric Relation Determination</h3>
                        <button id="rd-set-vd-cr">Set VD and CR</button>
                    </div>
                    <div class="module-step">
                        <h3>Step 9: Articulator Settings</h3>
                        <button id="rd-set-articulator">Set Articulator</button>
                    </div>
                    <div class="module-step">
                        <h3>Step 10: Tooth Selection</h3>
                        <select id="rd-tooth-selection">
                            <option>Select Tooth Mold</option>
                            <option>Mold A</option>
                            <option>Mold B</option>
                            <option>Mold C</option>
                        </select>
                    </div>
                    <div class="module-step">
                        <h3>Step 11: Teeth Setup</h3>
                        <button id="rd-setup-teeth">Setup Teeth</button>
                    </div>
                    <div class="module-step">
                        <h3>Step 12: Gingival Design</h3>
                        <button id="rd-design-gingiva">Design Gingiva</button>
                    </div>
                    <div class="module-step">
                        <h3>Step 13: Partial Denture Specific Design</h3>
                        <button id="rd-partial-design">Design Partial Components</button>
                    </div>
                    <div class="module-step">
                        <h3>Step 14: Denture Base Design</h3>
                        <button id="rd-design-base">Design Denture Base</button>
                    </div>
                    <div class="module-step">
                        <h3>Step 15: Retention Mechanism Design</h3>
                        <button id="rd-design-retention">Design Retention</button>
                    </div>
                    <div class="module-step">
                        <h3>Step 16: Try-in Design</h3>
                        <button id="rd-design-tryin">Design Try-in</button>
                    </div>
                    <div class="module-step">
                        <h3>Step 17: Occlusion Refinement</h3>
                        <button id="rd-refine-occlusion">Refine Occlusion</button>
                    </div>
                    <div class="module-step">
                        <h3>Step 18: Quality Check</h3>
                        <button id="rd-quality-check">Run Quality Check</button>
                    </div>
                    <div class="module-step">
                        <h3>Step 19: Finalization</h3>
                        <button id="rd-finalize">Finalize Design</button>
                    </div>
                    </div>

                    <!-- Implant Planning Module -->
                    <div id="implant-planning-module" class="module-page">
                    <h2>Implant Planning & Prosthesis Designing Module</h2>
                    <div class="module-step">
                        <h3>Step 1: Treatment Type Selection</h3>
                        <select id="ip-treatment-type">
                            <option>Select Treatment Type</option>
                            <option>Single Implant</option>
                            <option>Multiple Implants (Partial Arch)</option>
                            <option>Full Arch Implants</option>
                        </select>
                    </div>
                    <div class="module-step">
                        <h3>Step 2: Planning Scope Selection</h3>
                        <select id="ip-planning-scope">
                            <option>Select Planning Scope</option>
                            <option>Implant Planning</option>
                            <option>Prosthesis Design</option>
                            <option>Surgical Guide Design</option>
                        </select>
                    </div>
                    <div class="module-step">
                        <h3>Step 3: Scan Requirements</h3>
                        <input type="file" id="ip-scan-upload" multiple>
                    </div>
                    <div class="module-step">
                        <h3>Step 4: Implant Library Selection</h3>
                        <select id="ip-implant-library">
                            <option>Select Implant System</option>
                            <option>System A</option>
                            <option>System B</option>
                            <option>System C</option>
                        </select>
                    </div>
                    <div class="module-step">
                        <h3>Step 5: Implant Planning</h3>
                        <button id="ip-plan-implants">Plan Implants</button>
                    </div>
                    <div class="module-step">
                        <h3>Step 6: Abutment Selection</h3>
                        <select id="ip-abutment-selection">
                            <option>Select Abutment Type</option>
                            <option>Stock abutment</option>
                            <option>Multi-unit abutment</option>
                            <option>Custom abutment</option
                                                       </select>
                                                                       </div>
                                                                       <div class="module-step">
                                                                           <h3>Step 7: Socket Sealing Abutment Design</h3>
                                                                           <button id="ip-design-socket-seal">Design Socket Seal</button>
                                                                       </div>
                                                                       <div class="module-step">
                                                                           <h3>Step 8: Prosthesis Design</h3>
                                                                           <select id="ip-prosthesis-type">
                                                                               <option>Select Prosthesis Type</option>
                                                                               <option>Crown</option>
                                                                               <option>Bridge</option>
                                                                               <option>Full Arch (FP1)</option>
                                                                               <option>Full Arch (FP3)</option>
                                                                           </select>
                                                                           <button id="ip-design-prosthesis">Design Prosthesis</button>
                                                                       </div>
                                                                       <div class="module-step">
                                                                           <h3>Step 9: Surgical Guide Design</h3>
                                                                           <select id="ip-guide-type">
                                                                               <option>Select Guide Type</option>
                                                                               <option>Pilot</option>
                                                                               <option>Fully Guided</option>
                                                                           </select>
                                                                           <button id="ip-design-guide">Design Surgical Guide</button>
                                                                       </div>
                                                                       <div class="module-step">
                                                                           <h3>Step 10: Immediate Loading Prosthesis Design</h3>
                                                                           <button id="ip-design-immediate-prosthesis">Design Immediate Prosthesis</button>
                                                                       </div>
                                                                       <div class="module-step">
                                                                           <h3>Step 11: Quality Check</h3>
                                                                           <button id="ip-quality-check">Run Quality Check</button>
                                                                       </div>
                                                                       <div class="module-step">
                                                                           <h3>Step 12: Finalization</h3>
                                                                           <button id="ip-finalize">Finalize Plan</button>
                                                                       </div>
                                                                   </div>

                                                                   <!-- Maxillofacial Prosthesis Module -->
                                                                   <div id="maxillofacial-prosthesis-module" class="module-page">
                                                                       <h2>Maxillofacial Prosthesis Design Module</h2>
                                                                       <div class="module-step">
                                                                           <h3>Step 1: Prosthesis Type Selection</h3>
                                                                           <select id="mp-prosthesis-type">
                                                                               <option>Select Prosthesis Type</option>
                                                                               <option>Intra-oral</option>
                                                                               <option>Extra-oral</option>
                                                                           </select>
                                                                       </div>
                                                                       <div class="module-step">
                                                                           <h3>Step 2: Scan Requirements</h3>
                                                                           <input type="file" id="mp-scan-upload" multiple>
                                                                       </div>
                                                                       <div class="module-step">
                                                                           <h3>Step 3: Design Source Selection</h3>
                                                                           <select id="mp-design-source">
                                                                               <option>Select Design Source</option>
                                                                               <option>Library designs</option>
                                                                               <option>Contralateral anatomy</option>
                                                                               <option>Pre-existing prosthesis scan</option>
                                                                           </select>
                                                                       </div>
                                                                       <div class="module-step">
                                                                           <h3>Step 4: Defect Analysis</h3>
                                                                           <button id="mp-analyze-defect">Analyze Defect</button>
                                                                       </div>
                                                                       <div class="module-step">
                                                                           <h3>Step 5: Prosthesis Design Generation</h3>
                                                                           <button id="mp-generate-design">Generate Prosthesis Design</button>
                                                                       </div>
                                                                       <div class="module-step">
                                                                           <h3>Step 6: Design Modification</h3>
                                                                           <button id="mp-modify-design">Modify Design</button>
                                                                       </div>
                                                                       <div class="module-step">
                                                                           <h3>Step 7: Material Selection and Coloration</h3>
                                                                           <select id="mp-material">
                                                                               <option>Select Material</option>
                                                                               <option>Silicone</option>
                                                                               <option>Acrylic</option>
                                                                               <option>Other biocompatible material</option>
                                                                           </select>
                                                                           <input type="color" id="mp-color-selection">
                                                                       </div>
                                                                       <div class="module-step">
                                                                           <h3>Step 8: Retention Mechanism Design</h3>
                                                                           <select id="mp-retention-type">
                                                                               <option>Select Retention Type</option>
                                                                               <option>Implant attachments</option>
                                                                               <option>Adhesive</option>
                                                                               <option>Anatomical undercuts</option>
                                                                           </select>
                                                                           <button id="mp-design-retention">Design Retention</button>
                                                                       </div>
                                                                       <div class="module-step">
                                                                           <h3>Step 9: Quality Check</h3>
                                                                           <button id="mp-quality-check">Run Quality Check</button>
                                                                       </div>
                                                                       <div class="module-step">
                                                                           <h3>Step 10: Finalization</h3>
                                                                           <button id="mp-finalize">Finalize Design</button>
                                                                       </div>
                                                                   </div>

                                                                   <!-- Endodontic Access Prep Guide Module -->
                                                                   <div id="endodontic-guide-module" class="module-page">
                                                                       <h2>Endodontic Access Prep Guide Module</h2>
                                                                       <div class="module-step">
                                                                           <h3>Step 1: Tooth Selection</h3>
                                                                           <input type="text" id="eg-tooth-selection" placeholder="Enter tooth numbers">
                                                                       </div>
                                                                       <div class="module-step">
                                                                           <h3>Step 2: Scan Requirements</h3>
                                                                           <input type="file" id="eg-scan-upload" multiple>
                                                                       </div>
                                                                       <div class="module-step">
                                                                           <h3>Step 3: Scan Analysis</h3>
                                                                           <button id="eg-analyze-scan">Analyze Scan</button>
                                                                       </div>
                                                                       <div class="module-step">
                                                                           <h3>Step 4: Access Path Generation</h3>
                                                                           <button id="eg-generate-path">Generate Access Path</button>
                                                                       </div>
                                                                       <div class="module-step">
                                                                           <h3>Step 5: Access Design Modification</h3>
                                                                           <button id="eg-modify-access">Modify Access Design</button>
                                                                       </div>
                                                                       <div class="module-step">
                                                                           <h3>Step 6: Guide Design Generation</h3>
                                                                           <button id="eg-generate-guide">Generate Guide Design</button>
                                                                       </div>
                                                                       <div class="module-step">
                                                                           <h3>Step 7: Guide Design Modification</h3>
                                                                           <button id="eg-modify-guide">Modify Guide Design</button>
                                                                       </div>
                                                                       <div class="module-step">
                                                                           <h3>Step 8: Quality Check</h3>
                                                                           <button id="eg-quality-check">Run Quality Check</button>
                                                                       </div>
                                                                       <div class="module-step">
                                                                           <h3>Step 9: Finalization</h3>
                                                                           <button id="eg-finalize">Finalize Guide</button>
                                                                       </div>
                                                                   </div>
                                                               </div>
                                                           </div>

                                                           <div id="keyboard-shortcuts">
                                                               <h3>Keyboard Shortcuts</h3>
                                                               <p><strong>Ctrl + N:</strong> New Case</p>
                                                               <p><strong>Ctrl + D:</strong> Toggle Dark Mode</p>
                                                               <p><strong>Ctrl + S:</strong> Open Settings</p>
                                                               <p><strong>Esc:</strong> Close this window</p>
                                                           </div>

                                                           <script>
                                                               document.getElementById('login-form').addEventListener('submit', function(e) {
                                                                   e.preventDefault();
                                                                   const username = document.getElementById('username').value;
                                                                   document.querySelector('.login-box').style.display = 'none';
                                                                   document.querySelector('.dashboard').style.display = 'block';
                                                                   document.getElementById('user-name').textContent = username;
                                                               });

                                                               const themeToggle = document.getElementById('theme-toggle');
                                                               themeToggle.addEventListener('click', function() {
                                                                   document.body.classList.toggle('dark-theme');
                                                               });

                                                               const sidebarToggle = document.querySelector('.sidebar-toggle');
                                                               const sidebar = document.querySelector('.sidebar');
                                                               sidebarToggle.addEventListener('click', function() {
                                                                   sidebar.classList.toggle('active');
                                                               });

                                                               // Close sidebar when clicking outside of it
                                                               document.addEventListener('click', function(event) {
                                                                   if (!sidebar.contains(event.target) && !sidebarToggle.contains(event.target)) {
                                                                       sidebar.classList.remove('active');
                                                                   }
                                                               });

                                                               // Keyboard shortcuts
                                                               document.addEventListener('keydown', function(event) {
                                                                   if (event.ctrlKey && event.key === 'n') {
                                                                       event.preventDefault();
                                                                       console.log('New case shortcut triggered');
                                                                   } else if (event.ctrlKey && event.key === 'd') {
                                                                       event.preventDefault();
                                                                       document.body.classList.toggle('dark-theme');
                                                                   } else if (event.ctrlKey && event.key === 's') {
                                                                       event.preventDefault();
                                                                       console.log('Settings shortcut triggered');
                                                                   } else if (event.key === '?') {
                                                                       event.preventDefault();
                                                                       toggleKeyboardShortcuts();
                                                                   } else if (event.key === 'Escape') {
                                                                       closeKeyboardShortcuts();
                                                                   }
                                                               });

                                                               function toggleKeyboardShortcuts() {
                                                                   const shortcutsPanel = document.getElementById('keyboard-shortcuts');
                                                                   shortcutsPanel.style.display = shortcutsPanel.style.display === 'none' ? 'block' : 'none';
                                                               }

                                                               function closeKeyboardShortcuts() {
                                                                   document.getElementById('keyboard-shortcuts').style.display = 'none';
                                                               }

                                                               // Module navigation
                                                               const moduleCards = document.querySelectorAll('.module-card');
                                                               moduleCards.forEach(card => {
                                                                   card.addEventListener('click', function() {
                                                                       const moduleId = this.getAttribute('data-module');
                                                                       document.querySelectorAll('.module-page').forEach(content => {
                                                                           content.style.display = 'none';
                                                                       });
                                                                       document.getElementById(`${moduleId}-module`).style.display = 'block';
                                                                   });
                                                               });

                                                               // Finalization buttons
                                                               const finalizeButtons = document.querySelectorAll('[id$="-finalize"]');
                                                               finalizeButtons.forEach(button => {
                                                                   button.addEventListener('click', function() {
                                                                       const moduleId = this.id.split('-')[0];
                                                                       alert(`${moduleId.toUpperCase()} design finalized successfully!`);
                                                                   });
                                                               });

                                                               // New case button functionality
                                                               document.querySelector('.new-case-button').addEventListener('click', function() {
                                                                   console.log('New case button clicked');
                                                                   alert('Starting a new case. Please select a module to begin.');
                                                               });

                                                               // Simulated data loading for recent cases and personalized suggestions
                                                               function loadRecentCases() {
                                                                   const recentCasesElement = document.querySelector('.recent-cases');
                                                                   recentCasesElement.innerHTML = `
                                                                       <h3>Recent Cases</h3>
                                                                       <ul>
                                                                           <li>Case #1234 - Crown & Bridge</li>
                                                                           <li>Case #5678 - Smile Design</li>
                                                                           <li>Case #9012 - Implant Planning</li>
                                                                       </ul>
                                                                   `;
                                                               }

                                                               function loadPersonalizedSuggestions() {
                                                                   const forYouElement = document.querySelector('.for-you');
                                                                   forYouElement.innerHTML = `
                                                                       <h3>For You</h3>
                                                                       <ul>
                                                                           <li>Complete your profile for personalized recommendations</li>
                                                                           <li>Try out our new Smile Design module</li>
                                                                           <li>Update your skills in the latest implant techniques</li>
                                                                       </ul>
                                                                   `;
                                                               }

                                                               // Simulated data loading delay
                                                               setTimeout(() => {
                                                                   loadRecentCases();
                                                                   loadPersonalizedSuggestions();
                                                               }, 2000);

                                                               // Initialize tooltips for better UX (requires a tooltip library, this is a placeholder)
                                                               function initTooltips() {
                                                                   console.log('Tooltips initialized');
                                                                   // Implement actual tooltip initialization here
                                                               }

                                                               // Call this function when the page loads
                                                               window.addEventListener('load', initTooltips);
                                                           </script>
                                                       </body>
                                                       </html>
